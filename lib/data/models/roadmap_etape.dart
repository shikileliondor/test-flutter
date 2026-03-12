class RoadmapEtape {
  const RoadmapEtape({
    required this.id,
    required this.ordre,
    required this.titre,
    this.description,
  });

  final int id;
  final int ordre;
  final String titre;
  final String? description;

  factory RoadmapEtape.fromJson(Map<String, dynamic> json) {
    return RoadmapEtape(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
      titre: (json['titre'] as String?)?.trim() ?? 'Étape',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ordre': ordre,
        'titre': titre,
        'description': description,
      };
}
