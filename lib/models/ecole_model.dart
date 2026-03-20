class EcoleModel {
  const EcoleModel({
    required this.id,
    required this.nom,
    required this.ville,
    required this.type,
    required this.domaines,
    required this.filieres,
    required this.logoUrl,
  });

  final int id;
  final String nom;
  final String ville;
  final String type;
  final List<String> domaines;
  final List<String> filieres;
  final String logoUrl;

  factory EcoleModel.fromJson(Map<String, dynamic> json) {
    return EcoleModel(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      nom: (json['nom'] ?? json['name'] ?? '').toString(),
      ville: (json['ville'] ?? json['city'] ?? '').toString(),
      type: (json['type'] ?? json['type_etablissement'] ?? '').toString(),
      domaines: _toStringList(json['domaines'] ?? json['specialites']),
      filieres: _toStringList(json['filieres'] ?? json['formations']),
      logoUrl: (json['logo_url'] ?? json['logo'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'ville': ville,
        'type': type,
        'domaines': domaines,
        'filieres': filieres,
        'logo_url': logoUrl,
      };

  static List<String> _toStringList(dynamic source) {
    if (source is List) {
      return source.map((item) => item.toString()).toList();
    }
    return const <String>[];
  }
}
