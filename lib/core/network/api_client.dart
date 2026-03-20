import 'package:dio/dio.dart';

import '../config/api_config.dart';
import 'retry_interceptor.dart';

class ApiClient {
  ApiClient({
    Dio? dio,
    String? baseUrl,
    String? authToken,
    bool enableLogs = true,
  }) : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl ?? ApiConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
      headers: {
        'Accept': 'application/json',
        if (authToken != null && authToken.isNotEmpty) 'Authorization': 'Bearer $authToken',
      },
    );

    _dio.interceptors.add(RetryInterceptor(dio: _dio));

    if (enableLogs) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
    }
  }

  final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get<dynamic>(path, queryParameters: queryParameters, options: options);
  }

  Dio get dio => _dio;
}
