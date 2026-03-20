import '../../models/ecole_model.dart';
import 'ecole_api_service.dart';

class EcoleRepository {
  EcoleRepository({EcoleApiService? service}) : _service = service ?? EcoleApiService();

  final EcoleApiService _service;

  Future<List<EcoleModel>> listEcoles({
    String? search,
    String? ville,
    String? domaine,
    String? type,
  }) {
    return _service.getEcoles(
      search: search,
      ville: ville,
      domaine: domaine,
      type: type,
    );
  }
}
