class Ecole {
  const Ecole({
    required this.id,
    required this.nom,
    this.ville,
    this.pays,
    this.siteWeb,
  });

  final int id;
  final String nom;
  final String? ville;
  final String? pays;
  final String? siteWeb;

  factory Ecole.fromJson(Map<String, dynamic> json) {
    return Ecole(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nom: (json['nom'] as String?)?.trim() ?? 'École inconnue',
      ville: json['ville'] as String?,
      pays: json['pays'] as String?,
      siteWeb: json['site_web'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'ville': ville,
        'pays': pays,
        'site_web': siteWeb,
      };
}
