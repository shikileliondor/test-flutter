import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../error/error_mapper.dart';
import '../storage/secure_storage_service.dart';

final secureStorageProvider = Provider((ref) => SecureStorageService());

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    contentType: 'application/json',
  ));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.readToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) => handler.next(
        DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          error: ErrorMapper.map(error),
          type: error.type,
        ),
      ),
    ),
  );

  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  return dio;
});
