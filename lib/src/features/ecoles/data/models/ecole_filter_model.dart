import 'package:freezed_annotation/freezed_annotation.dart';

part 'ecole_filter_model.freezed.dart';
part 'ecole_filter_model.g.dart';

@freezed
class EcoleFilterModel with _$EcoleFilterModel {
  const factory EcoleFilterModel({
    @Default(<String>[]) List<String> villes,
    @Default(<String>[]) List<String> domaines,
    @Default(<String>[]) List<String> types,
  }) = _EcoleFilterModel;

  factory EcoleFilterModel.fromJson(Map<String, dynamic> json) =>
      _$EcoleFilterModelFromJson(json);
}
