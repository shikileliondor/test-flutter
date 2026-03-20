import '../../models/metier.dart';
import '../../models/metier_api_models.dart';
import 'metier_api_service.dart';

class MetierRepository {
  MetierRepository({MetierApiService? service}) : _service = service ?? MetierApiService();

  final MetierApiService _service;

  Future<List<MetierResume>> listResumes({String? search}) {
    return _service.getMetiers(search: search);
  }

  Future<MetierDetail> getDetail(int id) {
    return _service.getMetierDetail(id);
  }

  Future<List<Metier>> listMetiers({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) {
    return _service.getMetiersRich(
      search: search,
      domaine: domaine,
      dureeEtudes: dureeEtudes,
      niveauRequis: niveauRequis,
    );
  }

  Future<Metier> getMetierById(int id) {
    return _service.getMetierRichDetail(id);
  }
}
