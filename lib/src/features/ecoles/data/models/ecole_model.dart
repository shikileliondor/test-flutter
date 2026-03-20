import 'package:freezed_annotation/freezed_annotation.dart';

part 'ecole_model.freezed.dart';
part 'ecole_model.g.dart';

@freezed
class EcoleModel with _$EcoleModel {
  const factory EcoleModel({
    required int id,
    required String nom,
    required String ville,
    required String type,
    @Default(<String>[]) List<String> domaines,
    @Default(<String>[]) List<String> filieres,
    String? logoUrl,
  }) = _EcoleModel;

  factory EcoleModel.fromJson(Map<String, dynamic> json) =>
      _$EcoleModelFromJson({
        ...json,
        'logoUrl': json['logo_url'],
      });
}
