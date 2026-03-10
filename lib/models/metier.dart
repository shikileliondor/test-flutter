/// Modèle représentant un métier associé à une filière.
class Metier {
  /// Nom/titre du métier (ex: Développeur).
  final String titre;

  /// Description rapide du métier.
  final String description;

  /// Niveau d'études recommandé (ex: Bac+3).
  final String niveau;

  const Metier({
    required this.titre,
    required this.description,
    required this.niveau,
  });

  /// Construit un objet [Metier] à partir d'un JSON.
  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      titre: (json['titre'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      niveau: (json['niveau'] ?? '').toString(),
    );
  }
}
