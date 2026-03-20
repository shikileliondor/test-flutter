// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecole_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EcoleModel _$EcoleModelFromJson(Map<String, dynamic> json) {
  return _EcoleModel.fromJson(json);
}

/// @nodoc
mixin _$EcoleModel {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String> get domaines => throw _privateConstructorUsedError;
  List<String> get filieres => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Serializes this EcoleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcoleModelCopyWith<EcoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcoleModelCopyWith<$Res> {
  factory $EcoleModelCopyWith(
    EcoleModel value,
    $Res Function(EcoleModel) then,
  ) = _$EcoleModelCopyWithImpl<$Res, EcoleModel>;
  @useResult
  $Res call({
    int id,
    String nom,
    String ville,
    String type,
    List<String> domaines,
    List<String> filieres,
    String? logoUrl,
  });
}

/// @nodoc
class _$EcoleModelCopyWithImpl<$Res, $Val extends EcoleModel>
    implements $EcoleModelCopyWith<$Res> {
  _$EcoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? ville = null,
    Object? type = null,
    Object? domaines = null,
    Object? filieres = null,
    Object? logoUrl = freezed,
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
            ville: null == ville
                ? _value.ville
                : ville // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            domaines: null == domaines
                ? _value.domaines
                : domaines // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            filieres: null == filieres
                ? _value.filieres
                : filieres // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EcoleModelImplCopyWith<$Res>
    implements $EcoleModelCopyWith<$Res> {
  factory _$$EcoleModelImplCopyWith(
    _$EcoleModelImpl value,
    $Res Function(_$EcoleModelImpl) then,
  ) = __$$EcoleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String nom,
    String ville,
    String type,
    List<String> domaines,
    List<String> filieres,
    String? logoUrl,
  });
}

/// @nodoc
class __$$EcoleModelImplCopyWithImpl<$Res>
    extends _$EcoleModelCopyWithImpl<$Res, _$EcoleModelImpl>
    implements _$$EcoleModelImplCopyWith<$Res> {
  __$$EcoleModelImplCopyWithImpl(
    _$EcoleModelImpl _value,
    $Res Function(_$EcoleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EcoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? ville = null,
    Object? type = null,
    Object? domaines = null,
    Object? filieres = null,
    Object? logoUrl = freezed,
  }) {
    return _then(
      _$EcoleModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        ville: null == ville
            ? _value.ville
            : ville // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        domaines: null == domaines
            ? _value._domaines
            : domaines // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        filieres: null == filieres
            ? _value._filieres
            : filieres // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoleModelImpl implements _EcoleModel {
  const _$EcoleModelImpl({
    required this.id,
    required this.nom,
    required this.ville,
    required this.type,
    final List<String> domaines = const <String>[],
    final List<String> filieres = const <String>[],
    this.logoUrl,
  }) : _domaines = domaines,
       _filieres = filieres;

  factory _$EcoleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoleModelImplFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String ville;
  @override
  final String type;
  final List<String> _domaines;
  @override
  @JsonKey()
  List<String> get domaines {
    if (_domaines is EqualUnmodifiableListView) return _domaines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domaines);
  }

  final List<String> _filieres;
  @override
  @JsonKey()
  List<String> get filieres {
    if (_filieres is EqualUnmodifiableListView) return _filieres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filieres);
  }

  @override
  final String? logoUrl;

  @override
  String toString() {
    return 'EcoleModel(id: $id, nom: $nom, ville: $ville, type: $type, domaines: $domaines, filieres: $filieres, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._domaines, _domaines) &&
            const DeepCollectionEquality().equals(other._filieres, _filieres) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nom,
    ville,
    type,
    const DeepCollectionEquality().hash(_domaines),
    const DeepCollectionEquality().hash(_filieres),
    logoUrl,
  );

  /// Create a copy of EcoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcoleModelImplCopyWith<_$EcoleModelImpl> get copyWith =>
      __$$EcoleModelImplCopyWithImpl<_$EcoleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EcoleModelImplToJson(this);
  }
}

abstract class _EcoleModel implements EcoleModel {
  const factory _EcoleModel({
    required final int id,
    required final String nom,
    required final String ville,
    required final String type,
    final List<String> domaines,
    final List<String> filieres,
    final String? logoUrl,
  }) = _$EcoleModelImpl;

  factory _EcoleModel.fromJson(Map<String, dynamic> json) =
      _$EcoleModelImpl.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String get ville;
  @override
  String get type;
  @override
  List<String> get domaines;
  @override
  List<String> get filieres;
  @override
  String? get logoUrl;

  /// Create a copy of EcoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoleModelImplCopyWith<_$EcoleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
