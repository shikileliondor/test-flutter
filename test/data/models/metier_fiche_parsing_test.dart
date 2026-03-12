import 'package:app_test/data/models/metier_fiche.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MetierFiche.fromJson parses nested content safely', () {
    final fiche = MetierFiche.fromJson({
      'id': 4,
      'nom': 'Chef de projet',
      'description': 'Gère les projets',
      'salaire': {'min': 25000, 'moyen': 40000, 'max': 70000, 'devise': 'FCFA'},
      'duree_estimee': '3 à 5 ans',
      'competences': [
        {'id': 1, 'nom': 'Programmation'}
      ],
      'parcours_etudes': [
        {'id': 1, 'nom': 'Licence', 'niveau': 'Bac +3'}
      ],
      'ecoles_recommandees': [
        {'id': 1, 'nom': 'ESATIC', 'ville': 'Abidjan', 'pays': "Côte d'Ivoire"}
      ],
      'roadmap': [
        {'id': 1, 'ordre': 1, 'titre': 'Diplôme requis'}
      ]
    });

    expect(fiche.id, 4);
    expect(fiche.nom, 'Chef de projet');
    expect(fiche.salaire.moyen, 40000);
    expect(fiche.competences.single.nom, 'Programmation');
    expect(fiche.parcoursEtudes.single.niveau, 'Bac +3');
    expect(fiche.ecolesRecommandees.single.nom, 'ESATIC');
    expect(fiche.roadmap.single.ordre, 1);
  });
}
