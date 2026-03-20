import 'package:flutter_test/flutter_test.dart';
import 'package:parcours_app/src/features/metiers/data/models/metier_model.dart';

void main() {
  test('MetierModel parse JSON', () {
    final model = MetierModel.fromJson({
      'id': 1,
      'nom': 'Développeur',
      'description': 'Conçoit des applications',
      'salaires': {'min': 1000000, 'moyen': 2000000, 'max': 4000000},
      'duree_estimee': '3 ans',
      'competences': ['Dart'],
      'parcours_etudes': ['Licence'],
      'ecoles_recommandees': ['ESP'],
      'roadmap_etapes': ['Bases', 'Projet'],
    });

    expect(model.salaires.devise, 'FCFA');
    expect(model.competences.first, 'Dart');
  });
}
