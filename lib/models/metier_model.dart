class Metier {
  const Metier({
    required this.id,
    required this.nom,
    required this.description,
    required this.salaireMin,
    required this.salaireMoyen,
    required this.salaireMax,
  });

  final int id;
  final String nom;
  final String description;
  final double salaireMin;
  final double salaireMoyen;
  final double salaireMax;

  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      salaireMin: _toDouble(json['salaire_min']),
      salaireMoyen: _toDouble(json['salaire_moyen']),
      salaireMax: _toDouble(json['salaire_max']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value?.toString() ?? '') ?? 0;
  }
}

class SalaireFiche {
  const SalaireFiche({
    required this.min,
    required this.moyen,
    required this.max,
    required this.devise,
  });

  final double min;
  final double moyen;
  final double max;
  final String devise;

  factory SalaireFiche.fromJson(Map<String, dynamic> json) {
    return SalaireFiche(
      min: Metier._toDouble(json['min']),
      moyen: Metier._toDouble(json['moyen']),
      max: Metier._toDouble(json['max']),
      devise: (json['devise'] ?? 'EUR').toString(),
    );
  }
}

class EcoleRecommandee {
  const EcoleRecommandee({
    required this.nom,
    this.ville,
    this.pays,
  });

  final String nom;
  final String? ville;
  final String? pays;

  factory EcoleRecommandee.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return EcoleRecommandee(
        nom: (json['nom'] ?? '').toString(),
        ville: json['ville']?.toString(),
        pays: json['pays']?.toString(),
      );
    }

    return EcoleRecommandee(nom: json?.toString() ?? 'École inconnue');
  }
}

class MetierFiche {
  const MetierFiche({
    required this.nom,
    required this.description,
    required this.salaire,
    required this.dureeEstimee,
    required this.competences,
    required this.parcoursEtudes,
    required this.ecolesRecommandees,
    required this.roadmap,
  });

  final String nom;
  final String description;
  final SalaireFiche salaire;
  final String dureeEstimee;
  final List<String> competences;
  final List<String> parcoursEtudes;
  final List<EcoleRecommandee> ecolesRecommandees;
  final List<String> roadmap;

  factory MetierFiche.fromJson(Map<String, dynamic> json) {
    return MetierFiche(
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      salaire: SalaireFiche.fromJson(
        json['salaire'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      ),
      dureeEstimee: (json['duree_estimee'] ?? '').toString(),
      competences: _toStringList(json['competences']),
      parcoursEtudes: _toStringList(json['parcours_etudes']),
      ecolesRecommandees: (json['ecoles_recommandees'] as List<dynamic>? ?? const <dynamic>[])
          .map(EcoleRecommandee.fromJson)
          .toList(),
      roadmap: _toStringList(json['roadmap']),
    );
  }

  static List<String> _toStringList(dynamic list) {
    return (list as List<dynamic>? ?? const <dynamic>[])
        .map((item) => item.toString())
        .toList();
  }
}
