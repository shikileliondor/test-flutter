import 'package:dio/dio.dart';

import 'app_exception.dart';

class ErrorMapper {
  static AppException map(Object error) {
    if (error is AppException) return error;
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        return AppException('Délai de connexion dépassé');
      }
      if (error.type == DioExceptionType.connectionError) {
        return AppException('Aucune connexion internet');
      }
      final data = error.response?.data;
      if (data is Map<String, dynamic> && data['error'] is Map<String, dynamic>) {
        final err = data['error'] as Map<String, dynamic>;
        return AppException(
          (err['message'] ?? 'Erreur API').toString(),
          code: err['code']?.toString(),
          statusCode: error.response?.statusCode,
        );
      }
      return AppException(
        'Erreur HTTP ${error.response?.statusCode ?? ''}'.trim(),
        statusCode: error.response?.statusCode,
      );
    }
    return AppException('Erreur inattendue');
  }
}
