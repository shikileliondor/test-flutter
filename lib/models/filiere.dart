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
    final rawMetiers = (json['metiers'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .toList();

    return Filiere(
      nom: (json['filiere'] ?? '').toString(),
      iconName: (json['icon'] ?? '').toString(),
      metiers: rawMetiers
          .map((item) => Metier.fromJson(item))
          .toList(),
      interets: (json['interets'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => item.toString())
          .toList(),
    );
  }
}
