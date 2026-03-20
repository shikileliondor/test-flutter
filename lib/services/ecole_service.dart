import '../features/ecole/ecole_repository.dart';
import '../models/ecole_model.dart';

class EcoleService {
  EcoleService({
    this.baseUrl,
    this.useMockData = true,
    EcoleRepository? repository,
  }) : _repository = repository ?? EcoleRepository();

  final String? baseUrl;
  final bool useMockData;
  final EcoleRepository _repository;

  Future<List<EcoleModel>> fetchEcoles({
    String? search,
    String? ville,
    String? domaine,
    String? type,
  }) {
    return _repository.listEcoles(
      search: search,
      ville: ville,
      domaine: domaine,
      type: type,
    );
  }
}
