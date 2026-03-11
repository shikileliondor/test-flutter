class RoadmapMetier {
  const RoadmapMetier({
    required this.diplomeRequis,
    required this.competencesAApprendre,
    required this.experiencesRecommandees,
  });

  final String diplomeRequis;
  final List<String> competencesAApprendre;
  final List<String> experiencesRecommandees;

  factory RoadmapMetier.fromJson(Map<String, dynamic> json) {
    return RoadmapMetier(
      diplomeRequis: (json['diplome_requis'] ?? '').toString(),
      competencesAApprendre:
          (json['competences_a_apprendre'] as List<dynamic>? ?? const <dynamic>[])
              .map((item) => item.toString())
              .toList(),
      experiencesRecommandees:
          (json['experiences_recommandees'] as List<dynamic>? ?? const <dynamic>[])
              .map((item) => item.toString())
              .toList(),
    );
  }
}

class SalaireMetier {
  const SalaireMetier({
    required this.minimum,
    required this.moyen,
    required this.maximum,
  });

  final int minimum;
  final int moyen;
  final int maximum;

  factory SalaireMetier.fromJson(Map<String, dynamic> json) {
    return SalaireMetier(
      minimum: (json['minimum'] as num? ?? json['moyen'] as num? ?? 0).toInt(),
      moyen: (json['moyen'] as num? ?? 0).toInt(),
      maximum: (json['maximum'] as num? ?? json['moyen'] as num? ?? 0).toInt(),
    );
  }
}

class Metier {
  const Metier({
    required this.id,
    required this.nom,
    required this.description,
    required this.salaireMoyen,
    required this.competencesRequises,
    required this.filieresEtudes,
    required this.dureeEtudes,
    required this.ecolesRecommandees,
    required this.icone,
    required this.roadmap,
    required this.domaine,
    required this.niveauRequis,
  });

  final int id;
  final String nom;
  final String description;
  final SalaireMetier salaireMoyen;
  final List<String> competencesRequises;
  final List<String> filieresEtudes;
  final String dureeEtudes;
  final List<String> ecolesRecommandees;
  final String icone;
  final RoadmapMetier roadmap;
  final String domaine;
  final String niveauRequis;

  String get salaireFormate {
    if (salaireMoyen.moyen <= 0) {
      return 'Non renseigné';
    }
    return '${salaireMoyen.moyen} € / an';
  }

  factory Metier.fromJson(Map<String, dynamic> json) {
    final salairePayload = json['salaire_moyen'];
    final salaireMap = salairePayload is Map<String, dynamic>
        ? salairePayload
        : <String, dynamic>{'moyen': salairePayload};

    return Metier(
      id: (json['id'] as num? ?? 0).toInt(),
      nom: (json['nom'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      salaireMoyen: SalaireMetier.fromJson(salaireMap),
      competencesRequises:
          (json['competences_requises'] as List<dynamic>? ?? const <dynamic>[])
              .map((item) => item.toString())
              .toList(),
      filieresEtudes:
          (json['filieres_etudes'] as List<dynamic>? ?? const <dynamic>[])
              .map((item) => item.toString())
              .toList(),
      dureeEtudes: (json['duree_etudes'] ?? '').toString(),
      ecolesRecommandees:
          (json['ecoles_recommandees'] as List<dynamic>? ?? const <dynamic>[])
              .map((item) => item.toString())
              .toList(),
      icone: (json['icone'] ?? 'work_outline').toString(),
      roadmap: RoadmapMetier.fromJson(
        json['roadmap'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      ),
      domaine: (json['domaine'] ?? '').toString(),
      niveauRequis: (json['niveau_requis'] ?? '').toString(),
    );
  }
}
