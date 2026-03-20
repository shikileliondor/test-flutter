// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecole_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoleModelImpl _$$EcoleModelImplFromJson(
  Map<String, dynamic> json,
) => _$EcoleModelImpl(
  id: (json['id'] as num).toInt(),
  nom: json['nom'] as String,
  ville: json['ville'] as String,
  type: json['type'] as String,
  domaines:
      (json['domaines'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  filieres:
      (json['filieres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$$EcoleModelImplToJson(_$EcoleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'ville': instance.ville,
      'type': instance.type,
      'domaines': instance.domaines,
      'filieres': instance.filieres,
      'logoUrl': instance.logoUrl,
    };
