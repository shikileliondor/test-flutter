class Ecole {
  const Ecole({
    required this.nom,
    required this.ville,
    required this.formations,
  });

  final String nom;
  final String ville;
  final List<String> formations;

  factory Ecole.fromJson(Map<String, dynamic> json) {
    return Ecole(
      nom: (json['nom'] ?? '').toString(),
      ville: (json['ville'] ?? '').toString(),
      formations: (json['formations'] as List<dynamic>? ?? const <dynamic>[])
          .map((item) => item.toString())
          .toList(),
    );
  }
}

class RoadmapItem {
  const RoadmapItem({
    required this.titre,
    required this.duree,
    required this.details,
    required this.couleur,
    required this.icone,
  });

  final String titre;
  final String duree;
  final String details;
  final String couleur;
  final String icone;

  factory RoadmapItem.fromJson(Map<String, dynamic> json) {
    return RoadmapItem(
      titre: (json['titre'] ?? '').toString(),
      duree: (json['duree'] ?? '').toString(),
      details: (json['details'] ?? '').toString(),
      couleur: (json['couleur'] ?? '').toString(),
      icone: (json['icone'] ?? '').toString(),
    );
  }
}

class Filiere {
  const Filiere({
    required this.nom,
    required this.niveau,
    required this.description,
    required this.competences,
    required this.tailleMetier,
    required this.roadmap,
    required this.ecoles,
    required this.icone,
  });

  final String nom;
  final String niveau;
  final String description;
  final List<String> competences;
  final String tailleMetier;
  final List<RoadmapItem> roadmap;
  final List<Ecole> ecoles;
  final String icone;

  factory Filiere.fromJson(Map<String, dynamic> json) {
    return Filiere(
      nom: (json['nom'] ?? '').toString(),
      niveau: (json['niveau'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      competences: (json['competences'] as List<dynamic>? ?? const <dynamic>[])
          .map((item) => item.toString())
          .toList(),
      tailleMetier: (json['taille_metier'] ?? '').toString(),
      roadmap: (json['roadmap'] as List<dynamic>? ?? const <dynamic>[])
          .map((item) => RoadmapItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      ecoles: (json['ecoles'] as List<dynamic>? ?? const <dynamic>[])
          .map((item) => Ecole.fromJson(item as Map<String, dynamic>))
          .toList(),
      icone: (json['icone'] ?? 'explore').toString(),
    );
  }
}
