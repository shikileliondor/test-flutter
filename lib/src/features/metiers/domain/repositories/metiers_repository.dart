import '../../data/models/metier_model.dart';

abstract class MetiersRepository {
  Future<List<MetierModel>> getMetiers();
  Future<MetierModel> getMetier(int id);
}
