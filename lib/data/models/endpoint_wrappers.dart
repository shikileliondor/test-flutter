import 'competence.dart';
import 'ecole.dart';
import 'parcours_etude.dart';

class MetierCompetencesResponse {
  const MetierCompetencesResponse({required this.data});

  final List<Competence> data;

  factory MetierCompetencesResponse.fromJson(dynamic json) {
    if (json is! List) return const MetierCompetencesResponse(data: []);
    return MetierCompetencesResponse(
      data: json.whereType<Map<String, dynamic>>().map(Competence.fromJson).toList(),
    );
  }
}

class MetierParcoursEtudesResponse {
  const MetierParcoursEtudesResponse({required this.data});

  final List<ParcoursEtude> data;

  factory MetierParcoursEtudesResponse.fromJson(dynamic json) {
    if (json is! List) return const MetierParcoursEtudesResponse(data: []);
    return MetierParcoursEtudesResponse(
      data: json.whereType<Map<String, dynamic>>().map(ParcoursEtude.fromJson).toList(),
    );
  }
}

class MetierEcolesResponse {
  const MetierEcolesResponse({required this.data});

  final List<Ecole> data;

  factory MetierEcolesResponse.fromJson(dynamic json) {
    if (json is! List) return const MetierEcolesResponse(data: []);
    return MetierEcolesResponse(
      data: json.whereType<Map<String, dynamic>>().map(Ecole.fromJson).toList(),
    );
  }
}
