import 'package:dio/dio.dart';

import 'api_error.dart';

class DioExceptionMapper {
  const DioExceptionMapper._();

  static ApiError map(DioException exception) {
    final statusCode = exception.response?.statusCode;

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return const ApiError(
        type: ApiErrorType.timeout,
        message: 'La requête a expiré. Veuillez réessayer.',
      );
    }

    if (exception.type == DioExceptionType.connectionError ||
        exception.type == DioExceptionType.unknown) {
      return const ApiError(
        type: ApiErrorType.network,
        message: 'Aucune connexion réseau disponible.',
      );
    }

    if (statusCode == 401) {
      return const ApiError(type: ApiErrorType.unauthorized, message: 'Session expirée.');
    }

    if (statusCode == 403) {
      return const ApiError(type: ApiErrorType.forbidden, message: 'Accès interdit.');
    }

    if (statusCode == 404) {
      return const ApiError(type: ApiErrorType.notFound, message: 'Ressource introuvable.');
    }

    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      return ApiError(
        type: ApiErrorType.validation,
        statusCode: statusCode,
        message: 'Erreur de validation côté client.',
      );
    }

    if (statusCode != null && statusCode >= 500) {
      return ApiError(
        type: ApiErrorType.server,
        statusCode: statusCode,
        message: 'Erreur serveur temporaire.',
      );
    }

    return ApiError(
      type: ApiErrorType.unknown,
      statusCode: statusCode,
      message: exception.message ?? 'Erreur inattendue.',
    );
  }
}
