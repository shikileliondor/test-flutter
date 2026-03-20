import 'package:freezed_annotation/freezed_annotation.dart';

part 'metier_model.freezed.dart';
part 'metier_model.g.dart';

@freezed
class SalaireModel with _$SalaireModel {
  const factory SalaireModel({
    required int min,
    required int moyen,
    required int max,
    @Default('FCFA') String devise,
    @Default('annuel') String periode,
  }) = _SalaireModel;

  factory SalaireModel.fromJson(Map<String, dynamic> json) =>
      _$SalaireModelFromJson(json);
}

@freezed
class MetierModel with _$MetierModel {
  const factory MetierModel({
    required int id,
    required String nom,
    required String description,
    required SalaireModel salaires,
    String? dureeEstimee,
    @Default(<String>[]) List<String> competences,
    @Default(<String>[]) List<String> parcoursEtudes,
    @Default(<String>[]) List<String> ecolesRecommandees,
    @Default(<String>[]) List<String> roadmapEtapes,
    String? createdAt,
    String? updatedAt,
  }) = _MetierModel;

  factory MetierModel.fromJson(Map<String, dynamic> json) => _$MetierModelFromJson({
        ...json,
        'dureeEstimee': json['duree_estimee'],
        'parcoursEtudes': json['parcours_etudes'],
        'ecolesRecommandees': json['ecoles_recommandees'],
        'roadmapEtapes': json['roadmap_etapes'],
        'createdAt': json['created_at'],
        'updatedAt': json['updated_at'],
      });
}
