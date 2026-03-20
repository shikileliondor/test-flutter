// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SalaireModel _$SalaireModelFromJson(Map<String, dynamic> json) {
  return _SalaireModel.fromJson(json);
}

/// @nodoc
mixin _$SalaireModel {
  int get min => throw _privateConstructorUsedError;
  int get moyen => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  String get devise => throw _privateConstructorUsedError;
  String get periode => throw _privateConstructorUsedError;

  /// Serializes this SalaireModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalaireModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalaireModelCopyWith<SalaireModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaireModelCopyWith<$Res> {
  factory $SalaireModelCopyWith(
    SalaireModel value,
    $Res Function(SalaireModel) then,
  ) = _$SalaireModelCopyWithImpl<$Res, SalaireModel>;
  @useResult
  $Res call({int min, int moyen, int max, String devise, String periode});
}

/// @nodoc
class _$SalaireModelCopyWithImpl<$Res, $Val extends SalaireModel>
    implements $SalaireModelCopyWith<$Res> {
  _$SalaireModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalaireModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? moyen = null,
    Object? max = null,
    Object? devise = null,
    Object? periode = null,
  }) {
    return _then(
      _value.copyWith(
            min: null == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as int,
            moyen: null == moyen
                ? _value.moyen
                : moyen // ignore: cast_nullable_to_non_nullable
                      as int,
            max: null == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as int,
            devise: null == devise
                ? _value.devise
                : devise // ignore: cast_nullable_to_non_nullable
                      as String,
            periode: null == periode
                ? _value.periode
                : periode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SalaireModelImplCopyWith<$Res>
    implements $SalaireModelCopyWith<$Res> {
  factory _$$SalaireModelImplCopyWith(
    _$SalaireModelImpl value,
    $Res Function(_$SalaireModelImpl) then,
  ) = __$$SalaireModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int moyen, int max, String devise, String periode});
}

/// @nodoc
class __$$SalaireModelImplCopyWithImpl<$Res>
    extends _$SalaireModelCopyWithImpl<$Res, _$SalaireModelImpl>
    implements _$$SalaireModelImplCopyWith<$Res> {
  __$$SalaireModelImplCopyWithImpl(
    _$SalaireModelImpl _value,
    $Res Function(_$SalaireModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SalaireModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? moyen = null,
    Object? max = null,
    Object? devise = null,
    Object? periode = null,
  }) {
    return _then(
      _$SalaireModelImpl(
        min: null == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as int,
        moyen: null == moyen
            ? _value.moyen
            : moyen // ignore: cast_nullable_to_non_nullable
                  as int,
        max: null == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as int,
        devise: null == devise
            ? _value.devise
            : devise // ignore: cast_nullable_to_non_nullable
                  as String,
        periode: null == periode
            ? _value.periode
            : periode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaireModelImpl implements _SalaireModel {
  const _$SalaireModelImpl({
    required this.min,
    required this.moyen,
    required this.max,
    this.devise = 'FCFA',
    this.periode = 'annuel',
  });

  factory _$SalaireModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaireModelImplFromJson(json);

  @override
  final int min;
  @override
  final int moyen;
  @override
  final int max;
  @override
  @JsonKey()
  final String devise;
  @override
  @JsonKey()
  final String periode;

  @override
  String toString() {
    return 'SalaireModel(min: $min, moyen: $moyen, max: $max, devise: $devise, periode: $periode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaireModelImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.moyen, moyen) || other.moyen == moyen) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.devise, devise) || other.devise == devise) &&
            (identical(other.periode, periode) || other.periode == periode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, min, moyen, max, devise, periode);

  /// Create a copy of SalaireModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaireModelImplCopyWith<_$SalaireModelImpl> get copyWith =>
      __$$SalaireModelImplCopyWithImpl<_$SalaireModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaireModelImplToJson(this);
  }
}

abstract class _SalaireModel implements SalaireModel {
  const factory _SalaireModel({
    required final int min,
    required final int moyen,
    required final int max,
    final String devise,
    final String periode,
  }) = _$SalaireModelImpl;

  factory _SalaireModel.fromJson(Map<String, dynamic> json) =
      _$SalaireModelImpl.fromJson;

  @override
  int get min;
  @override
  int get moyen;
  @override
  int get max;
  @override
  String get devise;
  @override
  String get periode;

  /// Create a copy of SalaireModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalaireModelImplCopyWith<_$SalaireModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetierModel _$MetierModelFromJson(Map<String, dynamic> json) {
  return _MetierModel.fromJson(json);
}

/// @nodoc
mixin _$MetierModel {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SalaireModel get salaires => throw _privateConstructorUsedError;
  String? get dureeEstimee => throw _privateConstructorUsedError;
  List<String> get competences => throw _privateConstructorUsedError;
  List<String> get parcoursEtudes => throw _privateConstructorUsedError;
  List<String> get ecolesRecommandees => throw _privateConstructorUsedError;
  List<String> get roadmapEtapes => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MetierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetierModelCopyWith<MetierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetierModelCopyWith<$Res> {
  factory $MetierModelCopyWith(
    MetierModel value,
    $Res Function(MetierModel) then,
  ) = _$MetierModelCopyWithImpl<$Res, MetierModel>;
  @useResult
  $Res call({
    int id,
    String nom,
    String description,
    SalaireModel salaires,
    String? dureeEstimee,
    List<String> competences,
    List<String> parcoursEtudes,
    List<String> ecolesRecommandees,
    List<String> roadmapEtapes,
    String? createdAt,
    String? updatedAt,
  });

  $SalaireModelCopyWith<$Res> get salaires;
}

/// @nodoc
class _$MetierModelCopyWithImpl<$Res, $Val extends MetierModel>
    implements $MetierModelCopyWith<$Res> {
  _$MetierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = null,
    Object? salaires = null,
    Object? dureeEstimee = freezed,
    Object? competences = null,
    Object? parcoursEtudes = null,
    Object? ecolesRecommandees = null,
    Object? roadmapEtapes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            salaires: null == salaires
                ? _value.salaires
                : salaires // ignore: cast_nullable_to_non_nullable
                      as SalaireModel,
            dureeEstimee: freezed == dureeEstimee
                ? _value.dureeEstimee
                : dureeEstimee // ignore: cast_nullable_to_non_nullable
                      as String?,
            competences: null == competences
                ? _value.competences
                : competences // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            parcoursEtudes: null == parcoursEtudes
                ? _value.parcoursEtudes
                : parcoursEtudes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            ecolesRecommandees: null == ecolesRecommandees
                ? _value.ecolesRecommandees
                : ecolesRecommandees // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            roadmapEtapes: null == roadmapEtapes
                ? _value.roadmapEtapes
                : roadmapEtapes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalaireModelCopyWith<$Res> get salaires {
    return $SalaireModelCopyWith<$Res>(_value.salaires, (value) {
      return _then(_value.copyWith(salaires: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetierModelImplCopyWith<$Res>
    implements $MetierModelCopyWith<$Res> {
  factory _$$MetierModelImplCopyWith(
    _$MetierModelImpl value,
    $Res Function(_$MetierModelImpl) then,
  ) = __$$MetierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nom,
    String description,
    SalaireModel salaires,
    String? dureeEstimee,
    List<String> competences,
    List<String> parcoursEtudes,
    List<String> ecolesRecommandees,
    List<String> roadmapEtapes,
    String? createdAt,
    String? updatedAt,
  });

  @override
  $SalaireModelCopyWith<$Res> get salaires;
}

/// @nodoc
class __$$MetierModelImplCopyWithImpl<$Res>
    extends _$MetierModelCopyWithImpl<$Res, _$MetierModelImpl>
    implements _$$MetierModelImplCopyWith<$Res> {
  __$$MetierModelImplCopyWithImpl(
    _$MetierModelImpl _value,
    $Res Function(_$MetierModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = null,
    Object? salaires = null,
    Object? dureeEstimee = freezed,
    Object? competences = null,
    Object? parcoursEtudes = null,
    Object? ecolesRecommandees = null,
    Object? roadmapEtapes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$MetierModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        salaires: null == salaires
            ? _value.salaires
            : salaires // ignore: cast_nullable_to_non_nullable
                  as SalaireModel,
        dureeEstimee: freezed == dureeEstimee
            ? _value.dureeEstimee
            : dureeEstimee // ignore: cast_nullable_to_non_nullable
                  as String?,
        competences: null == competences
            ? _value._competences
            : competences // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        parcoursEtudes: null == parcoursEtudes
            ? _value._parcoursEtudes
            : parcoursEtudes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        ecolesRecommandees: null == ecolesRecommandees
            ? _value._ecolesRecommandees
            : ecolesRecommandees // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        roadmapEtapes: null == roadmapEtapes
            ? _value._roadmapEtapes
            : roadmapEtapes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetierModelImpl implements _MetierModel {
  const _$MetierModelImpl({
    required this.id,
    required this.nom,
    required this.description,
    required this.salaires,
    this.dureeEstimee,
    final List<String> competences = const <String>[],
    final List<String> parcoursEtudes = const <String>[],
    final List<String> ecolesRecommandees = const <String>[],
    final List<String> roadmapEtapes = const <String>[],
    this.createdAt,
    this.updatedAt,
  }) : _competences = competences,
       _parcoursEtudes = parcoursEtudes,
       _ecolesRecommandees = ecolesRecommandees,
       _roadmapEtapes = roadmapEtapes;

  factory _$MetierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetierModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String description;
  @override
  final SalaireModel salaires;
  @override
  final String? dureeEstimee;
  final List<String> _competences;
  @override
  @JsonKey()
  List<String> get competences {
    if (_competences is EqualUnmodifiableListView) return _competences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competences);
  }

  final List<String> _parcoursEtudes;
  @override
  @JsonKey()
  List<String> get parcoursEtudes {
    if (_parcoursEtudes is EqualUnmodifiableListView) return _parcoursEtudes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parcoursEtudes);
  }

  final List<String> _ecolesRecommandees;
  @override
  @JsonKey()
  List<String> get ecolesRecommandees {
    if (_ecolesRecommandees is EqualUnmodifiableListView)
      return _ecolesRecommandees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ecolesRecommandees);
  }

  final List<String> _roadmapEtapes;
  @override
  @JsonKey()
  List<String> get roadmapEtapes {
    if (_roadmapEtapes is EqualUnmodifiableListView) return _roadmapEtapes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roadmapEtapes);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'MetierModel(id: $id, nom: $nom, description: $description, salaires: $salaires, dureeEstimee: $dureeEstimee, competences: $competences, parcoursEtudes: $parcoursEtudes, ecolesRecommandees: $ecolesRecommandees, roadmapEtapes: $roadmapEtapes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.salaires, salaires) ||
                other.salaires == salaires) &&
            (identical(other.dureeEstimee, dureeEstimee) ||
                other.dureeEstimee == dureeEstimee) &&
            const DeepCollectionEquality().equals(
              other._competences,
              _competences,
            ) &&
            const DeepCollectionEquality().equals(
              other._parcoursEtudes,
              _parcoursEtudes,
            ) &&
            const DeepCollectionEquality().equals(
              other._ecolesRecommandees,
              _ecolesRecommandees,
            ) &&
            const DeepCollectionEquality().equals(
              other._roadmapEtapes,
              _roadmapEtapes,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nom,
    description,
    salaires,
    dureeEstimee,
    const DeepCollectionEquality().hash(_competences),
    const DeepCollectionEquality().hash(_parcoursEtudes),
    const DeepCollectionEquality().hash(_ecolesRecommandees),
    const DeepCollectionEquality().hash(_roadmapEtapes),
    createdAt,
    updatedAt,
  );

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetierModelImplCopyWith<_$MetierModelImpl> get copyWith =>
      __$$MetierModelImplCopyWithImpl<_$MetierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetierModelImplToJson(this);
  }
}

abstract class _MetierModel implements MetierModel {
  const factory _MetierModel({
    required final int id,
    required final String nom,
    required final String description,
    required final SalaireModel salaires,
    final String? dureeEstimee,
    final List<String> competences,
    final List<String> parcoursEtudes,
    final List<String> ecolesRecommandees,
    final List<String> roadmapEtapes,
    final String? createdAt,
    final String? updatedAt,
  }) = _$MetierModelImpl;

  factory _MetierModel.fromJson(Map<String, dynamic> json) =
      _$MetierModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String get description;
  @override
  SalaireModel get salaires;
  @override
  String? get dureeEstimee;
  @override
  List<String> get competences;
  @override
  List<String> get parcoursEtudes;
  @override
  List<String> get ecolesRecommandees;
  @override
  List<String> get roadmapEtapes;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of MetierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetierModelImplCopyWith<_$MetierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
