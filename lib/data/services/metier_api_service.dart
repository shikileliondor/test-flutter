import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/api_config.dart';
import '../models/competence.dart';
import '../models/ecole.dart';
import '../models/endpoint_wrappers.dart';
import '../models/metier.dart';
import '../models/metier_fiche.dart';
import '../models/parcours_etude.dart';
import 'api_exception.dart';

class MetierApiService {
  MetierApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: ApiConfig.baseUrl,
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 15),
                sendTimeout: const Duration(seconds: 10),
                responseType: ResponseType.json,
              ),
            ) {
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  final Dio _dio;

  Future<List<Metier>> getMetiers() async {
    final response = await _safeGet('/metiers');
    final data = response.data;
    if (data is! List) return <Metier>[];
    return data.whereType<Map<String, dynamic>>().map(Metier.fromJson).toList();
  }

  Future<Metier> getMetierById(int id) async {
    final response = await _safeGet('/metiers/$id');
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const ApiException('Réponse métier invalide.');
    }
    return Metier.fromJson(data);
  }

  Future<MetierFiche> getMetierFiche(int id) async {
    final response = await _safeGet('/metiers/$id/fiche');
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const ApiException('Réponse fiche invalide.');
    }
    return MetierFiche.fromJson(data);
  }

  Future<List<Competence>> getMetierCompetences(int id) async {
    final response = await _safeGet('/metiers/$id/competences');
    return MetierCompetencesResponse.fromJson(response.data).data;
  }

  Future<List<ParcoursEtude>> getMetierParcoursEtudes(int id) async {
    final response = await _safeGet('/metiers/$id/parcours-etudes');
    return MetierParcoursEtudesResponse.fromJson(response.data).data;
  }

  Future<List<Ecole>> getMetierEcoles(
    int id, {
    String? ville,
    String? pays,
  }) async {
    final response = await _safeGet(
      '/metiers/$id/ecoles',
      queryParameters: {
        if (ville != null && ville.isNotEmpty) 'ville': ville,
        if (pays != null && pays.isNotEmpty) 'pays': pays,
      },
    );
    return MetierEcolesResponse.fromJson(response.data).data;
  }

  Future<Response<dynamic>> _safeGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<dynamic>(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ApiException(_messageFromDioError(e), statusCode: e.response?.statusCode);
    } catch (_) {
      throw const ApiException('Erreur inattendue lors de l\'appel API.');
    }
  }

  String _messageFromDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'Délai d\'attente dépassé. Vérifiez votre connexion.';
    }
    if (error.type == DioExceptionType.connectionError) {
      return 'Impossible de joindre le serveur.';
    }
    if (error.response != null) {
      return 'Erreur API (${error.response?.statusCode}).';
    }
    return 'Erreur réseau inconnue.';
  }
}
