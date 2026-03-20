// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecole_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoleFilterModelImpl _$$EcoleFilterModelImplFromJson(
  Map<String, dynamic> json,
) => _$EcoleFilterModelImpl(
  villes:
      (json['villes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  domaines:
      (json['domaines'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  types:
      (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$$EcoleFilterModelImplToJson(
  _$EcoleFilterModelImpl instance,
) => <String, dynamic>{
  'villes': instance.villes,
  'domaines': instance.domaines,
  'types': instance.types,
};
