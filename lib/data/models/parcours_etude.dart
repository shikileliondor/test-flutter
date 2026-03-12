class ParcoursEtude {
  const ParcoursEtude({
    required this.id,
    required this.nom,
    this.niveau,
    this.description,
  });

  final int id;
  final String nom;
  final String? niveau;
  final String? description;

  factory ParcoursEtude.fromJson(Map<String, dynamic> json) {
    return ParcoursEtude(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nom: (json['nom'] as String?)?.trim() ?? 'Parcours inconnu',
      niveau: json['niveau'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'niveau': niveau,
        'description': description,
      };
}
