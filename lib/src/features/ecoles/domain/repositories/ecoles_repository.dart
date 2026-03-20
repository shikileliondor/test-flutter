import '../../data/models/ecole_filter_model.dart';
import '../../data/models/ecole_model.dart';
import '../../data/models/paginated_ecoles_model.dart';

abstract class EcolesRepository {
  Future<PaginatedEcolesModel> getEcoles(Map<String, dynamic> query);
  Future<EcoleModel> getEcole(int id);
  Future<EcoleFilterModel> getFilters();
  Future<void> createEcole(Map<String, dynamic> payload);
  Future<void> updateEcole(int id, Map<String, dynamic> payload);
  Future<void> deleteEcole(int id);
}
