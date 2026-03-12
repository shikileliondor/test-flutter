class Metier {
  const Metier({
    required this.id,
    required this.nom,
    this.description,
  });

  final int id;
  final String nom;
  final String? description;

  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nom: (json['nom'] as String?)?.trim() ?? 'Métier inconnu',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'description': description,
      };
}
