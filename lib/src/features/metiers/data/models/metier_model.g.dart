// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaireModelImpl _$$SalaireModelImplFromJson(Map<String, dynamic> json) =>
    _$SalaireModelImpl(
      min: (json['min'] as num).toInt(),
      moyen: (json['moyen'] as num).toInt(),
      max: (json['max'] as num).toInt(),
      devise: json['devise'] as String? ?? 'FCFA',
      periode: json['periode'] as String? ?? 'annuel',
    );

Map<String, dynamic> _$$SalaireModelImplToJson(_$SalaireModelImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'moyen': instance.moyen,
      'max': instance.max,
      'devise': instance.devise,
      'periode': instance.periode,
    };

_$MetierModelImpl _$$MetierModelImplFromJson(Map<String, dynamic> json) =>
    _$MetierModelImpl(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      description: json['description'] as String,
      salaires: SalaireModel.fromJson(json['salaires'] as Map<String, dynamic>),
      dureeEstimee: json['dureeEstimee'] as String?,
      competences:
          (json['competences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      parcoursEtudes:
          (json['parcoursEtudes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      ecolesRecommandees:
          (json['ecolesRecommandees'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      roadmapEtapes:
          (json['roadmapEtapes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$MetierModelImplToJson(_$MetierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'description': instance.description,
      'salaires': instance.salaires,
      'dureeEstimee': instance.dureeEstimee,
      'competences': instance.competences,
      'parcoursEtudes': instance.parcoursEtudes,
      'ecolesRecommandees': instance.ecolesRecommandees,
      'roadmapEtapes': instance.roadmapEtapes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
