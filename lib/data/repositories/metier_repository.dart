import '../models/competence.dart';
import '../models/ecole.dart';
import '../models/metier.dart';
import '../models/metier_fiche.dart';
import '../models/parcours_etude.dart';
import '../services/metier_api_service.dart';

class MetierRepository {
  MetierRepository(this._apiService);

  final MetierApiService _apiService;

  Future<List<Metier>> fetchMetiers() => _apiService.getMetiers();

  Future<Metier> fetchMetierById(int id) => _apiService.getMetierById(id);

  Future<MetierFiche> fetchMetierFiche(int id) => _apiService.getMetierFiche(id);

  Future<List<Competence>> fetchMetierCompetences(int id) => _apiService.getMetierCompetences(id);

  Future<List<ParcoursEtude>> fetchMetierParcoursEtudes(int id) =>
      _apiService.getMetierParcoursEtudes(id);

  Future<List<Ecole>> fetchMetierEcoles(int id, {String? ville, String? pays}) =>
      _apiService.getMetierEcoles(id, ville: ville, pays: pays);
}
