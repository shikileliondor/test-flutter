class Salaire {
  const Salaire({
    required this.min,
    required this.moyen,
    required this.max,
    required this.devise,
  });

  final int min;
  final int moyen;
  final int max;
  final String devise;

  factory Salaire.fromJson(Map<String, dynamic> json) {
    return Salaire(
      min: (json['min'] as num?)?.toInt() ?? 0,
      moyen: (json['moyen'] as num?)?.toInt() ?? 0,
      max: (json['max'] as num?)?.toInt() ?? 0,
      devise: (json['devise'] as String?)?.trim() ?? 'FCFA',
    );
  }

  Map<String, dynamic> toJson() => {
        'min': min,
        'moyen': moyen,
        'max': max,
        'devise': devise,
      };
}
