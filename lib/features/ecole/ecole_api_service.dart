import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../../core/network/dio_exception_mapper.dart';
import '../../core/network/response_parser.dart';
import '../../models/ecole_model.dart';

class EcoleApiService {
  EcoleApiService({ApiClient? client}) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<List<EcoleModel>> getEcoles({
    String? search,
    String? ville,
    String? domaine,
    String? type,
  }) async {
    try {
      final response = await _client.get(
        '/api/ecoles',
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (ville != null && ville.isNotEmpty) 'ville': ville,
          if (domaine != null && domaine.isNotEmpty) 'domaine': domaine,
          if (type != null && type.isNotEmpty) 'type': type,
        },
      );
      return ResponseParser.parseList(response.data).map(EcoleModel.fromJson).toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }
}
