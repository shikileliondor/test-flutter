class Competence {
  const Competence({
    required this.id,
    required this.nom,
    this.description,
  });

  final int id;
  final String nom;
  final String? description;

  factory Competence.fromJson(Map<String, dynamic> json) {
    return Competence(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nom: (json['nom'] as String?)?.trim() ?? 'Sans nom',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'description': description,
      };
}
