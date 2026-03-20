import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../storage/token_storage.dart';
import 'network_debug_state.dart';
import 'response_parser.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor({Logger? logger}) : _logger = logger ?? Logger();

  final Logger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('[REQ] ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    NetworkDebugState.setStatusCode(response.statusCode);
    NetworkDebugState.setError(null);
    _logger.i('[RES] ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    NetworkDebugState.setStatusCode(err.response?.statusCode);
    NetworkDebugState.setError(err.message);
    _logger.e('[ERR] ${err.requestOptions.uri}', error: err.message);
    handler.next(err);
  }
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required TokenStorage tokenStorage}) : _tokenStorage = tokenStorage;

  final TokenStorage _tokenStorage;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({
    required Dio dio,
    required TokenStorage tokenStorage,
  })  : _dio = dio,
        _tokenStorage = tokenStorage;

  final Dio _dio;
  final TokenStorage _tokenStorage;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final alreadyRetried = err.requestOptions.extra['retried_401'] == true;

    if (statusCode != 401 || alreadyRetried || err.requestOptions.path.contains('/auth/refresh')) {
      handler.next(err);
      return;
    }

    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      handler.next(err);
      return;
    }

    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: _dio.options.baseUrl,
          connectTimeout: _dio.options.connectTimeout,
          receiveTimeout: _dio.options.receiveTimeout,
          sendTimeout: _dio.options.sendTimeout,
          headers: _dio.options.headers,
        ),
      );

      final refreshResponse = await refreshDio.post<dynamic>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final payload = ResponseParser.parseObject(refreshResponse.data);
      final newAccessToken = payload['accessToken']?.toString();
      final newRefreshToken = payload['refreshToken']?.toString();

      if ((newAccessToken ?? '').isEmpty || (newRefreshToken ?? '').isEmpty) {
        handler.next(err);
        return;
      }

      await _tokenStorage.saveTokens(
        accessToken: newAccessToken!,
        refreshToken: newRefreshToken!,
      );

      final requestOptions = err.requestOptions;
      requestOptions.extra['retried_401'] = true;
      requestOptions.headers[HttpHeaders.authorizationHeader] = 'Bearer $newAccessToken';

      final retryResponse = await _dio.fetch<dynamic>(requestOptions);
      handler.resolve(retryResponse);
    } catch (_) {
      await _tokenStorage.clear();
      handler.next(err);
    }
  }
}
