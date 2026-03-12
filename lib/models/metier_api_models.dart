class MetierResume {
  const MetierResume({
    required this.id,
    required this.nom,
    required this.description,
  });

  final int id;
  final String nom;
  final String description;

  factory MetierResume.fromJson(Map<String, dynamic> json) {
    return MetierResume(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
    );
  }
}

class MetierDetail {
  const MetierDetail({
    required this.id,
    required this.nom,
    required this.description,
    required this.salaires,
    required this.dureeEstimee,
    required this.competences,
    required this.parcoursEtudes,
    required this.ecolesRecommandees,
    required this.roadmapEtapes,
  });

  final int id;
  final String nom;
  final String description;
  final List<Salaire> salaires;
  final String dureeEstimee;
  final List<Competence> competences;
  final List<ParcoursEtude> parcoursEtudes;
  final List<Ecole> ecolesRecommandees;
  final List<RoadmapEtape> roadmapEtapes;

  factory MetierDetail.fromJson(Map<String, dynamic> json) {
    return MetierDetail(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      salaires: _readList(json, ['salaires'])
          .map((item) => Salaire.fromJson(item))
          .toList(),
      dureeEstimee: (json['duree_estimee'] ?? '').toString(),
      competences: _readList(json, ['competences'])
          .map((item) => Competence.fromJson(item))
          .toList(),
      parcoursEtudes: _readList(json, ['parcours_etudes'])
          .map((item) => ParcoursEtude.fromJson(item))
          .toList(),
      ecolesRecommandees: _readList(json, ['ecoles_recommandees', 'ecoles'])
          .map((item) => Ecole.fromJson(item))
          .toList(),
      roadmapEtapes: _readList(json, ['roadmap_etapes'])
          .map((item) => RoadmapEtape.fromJson(item))
          .toList(),
    );
  }

  static List<Map<String, dynamic>> _readList(
    Map<String, dynamic> json,
    List<String> keys,
  ) {
    for (final key in keys) {
      final rawValue = json[key];
      if (rawValue is List) {
        return rawValue
            .whereType<Map>()
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
      }
    }
    return const [];
  }
}

class Salaire {
  const Salaire({
    required this.min,
    required this.moyen,
    required this.max,
    required this.devise,
    required this.periode,
  });

  final double min;
  final double moyen;
  final double max;
  final String devise;
  final String periode;

  String get readable =>
      'Min: ${min.toStringAsFixed(0)} $devise • Moyen: ${moyen.toStringAsFixed(0)} $devise • Max: ${max.toStringAsFixed(0)} $devise / $periode';

  factory Salaire.fromJson(Map<String, dynamic> json) {
    return Salaire(
      min: (json['min'] as num? ?? 0).toDouble(),
      moyen: (json['moyen'] as num? ?? 0).toDouble(),
      max: (json['max'] as num? ?? 0).toDouble(),
      devise: (json['devise'] ?? '€').toString(),
      periode: (json['periode'] ?? 'mois').toString(),
    );
  }
}

class Competence {
  const Competence({
    required this.id,
    required this.nom,
    required this.description,
  });

  final int id;
  final String nom;
  final String description;

  factory Competence.fromJson(Map<String, dynamic> json) {
    return Competence(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
    );
  }
}

class ParcoursEtude {
  const ParcoursEtude({
    required this.id,
    required this.nom,
    required this.description,
  });

  final int id;
  final String nom;
  final String description;

  factory ParcoursEtude.fromJson(Map<String, dynamic> json) {
    return ParcoursEtude(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
    );
  }
}

class Ecole {
  const Ecole({
    required this.id,
    required this.nom,
    required this.localisation,
  });

  final int id;
  final String nom;
  final String localisation;

  factory Ecole.fromJson(Map<String, dynamic> json) {
    return Ecole(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      localisation: (json['localisation'] ?? '').toString(),
    );
  }
}

class RoadmapEtape {
  const RoadmapEtape({
    required this.id,
    required this.titre,
    required this.description,
    required this.ordre,
  });

  final int id;
  final String titre;
  final String description;
  final int ordre;

  factory RoadmapEtape.fromJson(Map<String, dynamic> json) {
    return RoadmapEtape(
      id: (json['id'] as num? ?? 0).toInt(),
      titre: (json['titre'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      ordre: (json['ordre'] as num? ?? 0).toInt(),
    );
  }
}
