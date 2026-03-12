import 'competence.dart';
import 'ecole.dart';
import 'parcours_etude.dart';
import 'roadmap_etape.dart';
import 'salaire.dart';

class MetierFiche {
  const MetierFiche({
    required this.id,
    required this.nom,
    this.description,
    required this.salaire,
    this.dureeEstimee,
    required this.competences,
    required this.parcoursEtudes,
    required this.ecolesRecommandees,
    required this.roadmap,
  });

  final int id;
  final String nom;
  final String? description;
  final Salaire salaire;
  final String? dureeEstimee;
  final List<Competence> competences;
  final List<ParcoursEtude> parcoursEtudes;
  final List<Ecole> ecolesRecommandees;
  final List<RoadmapEtape> roadmap;

  factory MetierFiche.fromJson(Map<String, dynamic> json) {
    List<T> parseList<T>(dynamic input, T Function(Map<String, dynamic>) fromJson) {
      if (input is! List) return <T>[];
      return input
          .whereType<Map<String, dynamic>>()
          .map(fromJson)
          .toList(growable: false);
    }

    return MetierFiche(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nom: (json['nom'] as String?)?.trim() ?? 'Métier inconnu',
      description: json['description'] as String?,
      salaire: Salaire.fromJson((json['salaire'] as Map<String, dynamic>?) ?? const {}),
      dureeEstimee: json['duree_estimee'] as String?,
      competences: parseList(json['competences'], Competence.fromJson),
      parcoursEtudes: parseList(json['parcours_etudes'], ParcoursEtude.fromJson),
      ecolesRecommandees: parseList(json['ecoles_recommandees'], Ecole.fromJson),
      roadmap: parseList(json['roadmap'], RoadmapEtape.fromJson),
    );
  }
}
