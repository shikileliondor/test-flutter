import 'metier.dart';

/// Modèle représentant une filière scolaire.
class Filiere {
  /// Nom de la filière (ex: Informatique).
  final String nom;

  /// Nom d'icône Material associé à la filière.
  final String iconName;

  /// Liste des métiers principaux de la filière.
  final List<Metier> metiers;

  /// Centres d'intérêt liés à cette filière (utilisé pour filtrer les recommandations).
  final List<String> interets;

  const Filiere({
    required this.nom,
    required this.iconName,
    required this.metiers,
    required this.interets,
  });

  /// Construit un objet [Filiere] à partir d'un JSON.
  factory Filiere.fromJson(Map<String, dynamic> json) {
    return Filiere(
      nom: json['filiere'] as String,
      iconName: json['icon'] as String,
      metiers: (json['metiers'] as List<dynamic>)
          .map((item) => Metier.fromJson(item as Map<String, dynamic>))
          .toList(),
      interets: (json['interets'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
    );
  }
}
