import 'dart:async';

import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({required this.dio, this.maxRetries = 2});

  final Dio dio;
  final int maxRetries;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final retries = (err.requestOptions.extra['retries'] as int?) ?? 0;
    final shouldRetry = retries < maxRetries && _isRetryable(err);

    if (!shouldRetry) {
      return handler.next(err);
    }

    final nextRetries = retries + 1;
    err.requestOptions.extra['retries'] = nextRetries;

    await Future<void>.delayed(Duration(milliseconds: 300 * nextRetries));

    try {
      final response = await dio.fetch<dynamic>(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  bool _isRetryable(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        (e.response?.statusCode != null && e.response!.statusCode! >= 500);
  }
}
