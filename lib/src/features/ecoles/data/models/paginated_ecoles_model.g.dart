// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_ecoles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedEcolesModelImpl _$$PaginatedEcolesModelImplFromJson(
  Map<String, dynamic> json,
) => _$PaginatedEcolesModelImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => EcoleModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EcoleModel>[],
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
  lastPage: (json['lastPage'] as num?)?.toInt() ?? 1,
  perPage: (json['perPage'] as num?)?.toInt() ?? 15,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$PaginatedEcolesModelImplToJson(
  _$PaginatedEcolesModelImpl instance,
) => <String, dynamic>{
  'items': instance.items,
  'currentPage': instance.currentPage,
  'lastPage': instance.lastPage,
  'perPage': instance.perPage,
  'total': instance.total,
};
