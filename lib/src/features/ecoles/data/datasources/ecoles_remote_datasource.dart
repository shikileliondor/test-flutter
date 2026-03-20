import 'package:dio/dio.dart';

import '../models/ecole_filter_model.dart';
import '../models/ecole_model.dart';
import '../models/paginated_ecoles_model.dart';

class EcolesRemoteDataSource {
  EcolesRemoteDataSource(this._dio);
  final Dio _dio;

  Future<PaginatedEcolesModel> fetchEcoles(Map<String, dynamic> query) async {
    final response = await _dio.get('/api/v1/ecoles', queryParameters: query);
    final json = response.data as Map<String, dynamic>;
    final data = json['data'] as Map<String, dynamic>;
    return PaginatedEcolesModel(
      items: (data['data'] as List<dynamic>)
          .map((e) => EcoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: data['current_page'] as int? ?? 1,
      lastPage: data['last_page'] as int? ?? 1,
      perPage: int.tryParse(data['per_page'].toString()) ?? 15,
      total: data['total'] as int? ?? 0,
    );
  }

  Future<EcoleFilterModel> fetchFilters() async {
    final response = await _dio.get('/api/v1/ecoles/filters');
    return EcoleFilterModel.fromJson(
      (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
    );
  }

  Future<EcoleModel> fetchEcoleById(int id) async {
    final response = await _dio.get('/api/v1/ecoles/$id');
    return EcoleModel.fromJson(
      (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
    );
  }

  Future<void> createEcole(Map<String, dynamic> payload) async {
    await _dio.post('/api/v1/admin/ecoles', data: payload);
  }

  Future<void> updateEcole(int id, Map<String, dynamic> payload) async {
    await _dio.patch('/api/v1/admin/ecoles/$id', data: payload);
  }

  Future<void> deleteEcole(int id) async {
    await _dio.delete('/api/v1/admin/ecoles/$id');
  }
}
