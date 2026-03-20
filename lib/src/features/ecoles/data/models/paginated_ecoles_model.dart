import 'package:freezed_annotation/freezed_annotation.dart';

import 'ecole_model.dart';

part 'paginated_ecoles_model.freezed.dart';
part 'paginated_ecoles_model.g.dart';

@freezed
class PaginatedEcolesModel with _$PaginatedEcolesModel {
  const factory PaginatedEcolesModel({
    @Default(<EcoleModel>[]) List<EcoleModel> items,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(15) int perPage,
    @Default(0) int total,
  }) = _PaginatedEcolesModel;

  factory PaginatedEcolesModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedEcolesModelFromJson(json);
}
