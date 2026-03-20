import '../../../../core/storage/cache_service.dart';
import '../../domain/repositories/ecoles_repository.dart';
import '../datasources/ecoles_remote_datasource.dart';
import '../models/ecole_filter_model.dart';
import '../models/ecole_model.dart';
import '../models/paginated_ecoles_model.dart';

class EcolesRepositoryImpl implements EcolesRepository {
  EcolesRepositoryImpl(this._remote, this._cache);
  final EcolesRemoteDataSource _remote;
  final CacheService _cache;

  @override
  Future<PaginatedEcolesModel> getEcoles(Map<String, dynamic> query) async {
    try {
      final res = await _remote.fetchEcoles(query);
      await _cache.putJson(
        'ecoles_cache',
        {'items': res.items.map((e) => e.toJson()).toList()},
      );
      return res;
    } catch (_) {
      final cached = await _cache.getJsonMap('ecoles_cache');
      final items = (cached?['items'] as List<dynamic>? ?? [])
          .map((e) => EcoleModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return PaginatedEcolesModel(items: items, total: items.length);
    }
  }

  @override
  Future<EcoleModel> getEcole(int id) => _remote.fetchEcoleById(id);

  @override
  Future<EcoleFilterModel> getFilters() => _remote.fetchFilters();

  @override
  Future<void> createEcole(Map<String, dynamic> payload) =>
      _remote.createEcole(payload);

  @override
  Future<void> updateEcole(int id, Map<String, dynamic> payload) =>
      _remote.updateEcole(id, payload);

  @override
  Future<void> deleteEcole(int id) => _remote.deleteEcole(id);
}
