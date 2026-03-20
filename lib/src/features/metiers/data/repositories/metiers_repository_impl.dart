import '../../domain/repositories/metiers_repository.dart';
import '../datasources/metiers_remote_datasource.dart';
import '../models/metier_model.dart';

class MetiersRepositoryImpl implements MetiersRepository {
  MetiersRepositoryImpl(this._remote);
  final MetiersRemoteDataSource _remote;

  @override
  Future<MetierModel> getMetier(int id) => _remote.fetchMetier(id);

  @override
  Future<List<MetierModel>> getMetiers() => _remote.fetchMetiers();
}
