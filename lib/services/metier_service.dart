import '../features/metier/metier_repository.dart';
import '../models/metier.dart';

class MetierService {
  MetierService({
    this.baseUrl,
    this.useMockData = false,
    MetierRepository? repository,
  }) : _repository = repository ?? MetierRepository();

  final String? baseUrl;
  final bool useMockData;
  final MetierRepository _repository;

  Future<List<Metier>> fetchMetiers({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) {
    return _repository.listMetiers(
      search: search,
      domaine: domaine,
      dureeEtudes: dureeEtudes,
      niveauRequis: niveauRequis,
    );
  }

  Future<Metier> fetchMetierById(int id) {
    return _repository.getMetierById(id);
  }
}
