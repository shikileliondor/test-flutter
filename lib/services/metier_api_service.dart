import 'package:dio/dio.dart';

import '../models/metier_api_models.dart';

class MetierApiService {
  MetierApiService({Dio? dio, String? baseUrl})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl ??
                    const String.fromEnvironment(
                      'API_BASE_URL',
                      defaultValue: 'http://10.0.2.2:8000',
                    ),
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
                responseType: ResponseType.json,
              ),
            );

  final Dio _dio;

  Future<List<MetierResume>> getMetiers() async {
    final response = await _dio.get<dynamic>('/api/metiers');
    final payload = response.data;

    if (payload is List) {
      return payload
          .whereType<Map>()
          .map((item) => MetierResume.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }

    if (payload is Map<String, dynamic> && payload['data'] is List) {
      return (payload['data'] as List)
          .whereType<Map>()
          .map((item) => MetierResume.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }

    return const [];
  }

  Future<MetierDetail> getMetierDetail(int id) async {
    final response = await _dio.get<dynamic>('/api/metiers/$id');
    final payload = response.data;

    if (payload is Map<String, dynamic>) {
      if (payload['data'] is Map<String, dynamic>) {
        return MetierDetail.fromJson(payload['data'] as Map<String, dynamic>);
      }
      return MetierDetail.fromJson(payload);
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      message: 'Format de réponse invalide pour le détail métier',
    );
  }
}
