import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../../core/network/dio_exception_mapper.dart';
import '../../core/network/response_parser.dart';
import '../../models/metier.dart';
import '../../models/metier_api_models.dart';

class MetierApiService {
  MetierApiService({ApiClient? client}) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<List<MetierResume>> getMetiers({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) async {
    try {
      final response = await _client.get(
        '/api/metiers',
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (domaine != null && domaine.isNotEmpty) 'domaine': domaine,
          if (dureeEtudes != null && dureeEtudes.isNotEmpty) 'duree_etudes': dureeEtudes,
          if (niveauRequis != null && niveauRequis.isNotEmpty) 'niveau_requis': niveauRequis,
        },
      );
      final list = ResponseParser.parseList(response.data);
      return list.map(MetierResume.fromJson).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<MetierDetail> getMetierDetail(int id) async {
    try {
      final response = await _client.get('/api/metiers/$id');
      final data = ResponseParser.parseObject(response.data);
      return MetierDetail.fromJson(data);
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<List<Metier>> getMetiersRich({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) async {
    try {
      final response = await _client.get(
        '/api/metiers',
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (domaine != null && domaine.isNotEmpty) 'domaine': domaine,
          if (dureeEtudes != null && dureeEtudes.isNotEmpty) 'duree_etudes': dureeEtudes,
          if (niveauRequis != null && niveauRequis.isNotEmpty) 'niveau_requis': niveauRequis,
        },
      );
      return ResponseParser.parseList(response.data).map(Metier.fromJson).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<Metier> getMetierRichDetail(int id) async {
    try {
      final response = await _client.get('/api/metiers/$id');
      return Metier.fromJson(ResponseParser.parseObject(response.data));
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }
}
