import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../storage/token_storage.dart';
import 'app_interceptors.dart';
import 'retry_interceptor.dart';

class ApiClient {
  ApiClient({
    Dio? dio,
    String? baseUrl,
    bool enableLogs = true,
    TokenStorage? tokenStorage,
  }) : _dio = dio ?? Dio() {
    final storage = tokenStorage ?? AppTokenStorage();

    _dio.options = BaseOptions(
      baseUrl: baseUrl ?? ApiConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      responseType: ResponseType.json,
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    _dio.interceptors.addAll([
      AuthInterceptor(tokenStorage: storage),
      RefreshTokenInterceptor(dio: _dio, tokenStorage: storage),
      RetryInterceptor(dio: _dio, maxRetries: 2),
      if (enableLogs) LoggerInterceptor(),
    ]);
  }

  final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get<dynamic>(path, queryParameters: queryParameters, options: options);
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.post<dynamic>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Dio get dio => _dio;
}
