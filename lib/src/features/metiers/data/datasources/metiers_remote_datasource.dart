import 'package:dio/dio.dart';

import '../models/metier_model.dart';

class MetiersRemoteDataSource {
  MetiersRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<MetierModel>> fetchMetiers() async {
    final response = await _dio.get('/api/metiers');
    final list = ((response.data as Map<String, dynamic>)['data'] ?? []) as List<dynamic>;
    return list.map((e) => MetierModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<MetierModel> fetchMetier(int id) async {
    final detail = await _dio.get('/api/metiers/$id');
    final data = (detail.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;

    final competences = await _dio.get('/api/metiers/$id/competences');
    final parcours = await _dio.get('/api/metiers/$id/parcours-etudes');
    final ecoles = await _dio.get('/api/metiers/$id/ecoles');
    final fiche = await _dio.get('/api/metiers/$id/fiche');

    return MetierModel.fromJson({
      ...data,
      ...((fiche.data as Map<String, dynamic>)['data'] as Map<String, dynamic>? ?? {}),
      'competences': ((competences.data as Map<String, dynamic>)['data'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      'parcours_etudes': ((parcours.data as Map<String, dynamic>)['data'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      'ecoles_recommandees': ((ecoles.data as Map<String, dynamic>)['data'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    });
  }
}
