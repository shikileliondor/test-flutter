// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecole_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EcoleFilterModel _$EcoleFilterModelFromJson(Map<String, dynamic> json) {
  return _EcoleFilterModel.fromJson(json);
}

/// @nodoc
mixin _$EcoleFilterModel {
  List<String> get villes => throw _privateConstructorUsedError;
  List<String> get domaines => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;

  /// Serializes this EcoleFilterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcoleFilterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcoleFilterModelCopyWith<EcoleFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcoleFilterModelCopyWith<$Res> {
  factory $EcoleFilterModelCopyWith(
    EcoleFilterModel value,
    $Res Function(EcoleFilterModel) then,
  ) = _$EcoleFilterModelCopyWithImpl<$Res, EcoleFilterModel>;
  @useResult
  $Res call({List<String> villes, List<String> domaines, List<String> types});
}

/// @nodoc
class _$EcoleFilterModelCopyWithImpl<$Res, $Val extends EcoleFilterModel>
    implements $EcoleFilterModelCopyWith<$Res> {
  _$EcoleFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcoleFilterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? villes = null,
    Object? domaines = null,
    Object? types = null,
  }) {
    return _then(
      _value.copyWith(
            villes: null == villes
                ? _value.villes
                : villes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            domaines: null == domaines
                ? _value.domaines
                : domaines // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            types: null == types
                ? _value.types
                : types // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EcoleFilterModelImplCopyWith<$Res>
    implements $EcoleFilterModelCopyWith<$Res> {
  factory _$$EcoleFilterModelImplCopyWith(
    _$EcoleFilterModelImpl value,
    $Res Function(_$EcoleFilterModelImpl) then,
  ) = __$$EcoleFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> villes, List<String> domaines, List<String> types});
}

/// @nodoc
class __$$EcoleFilterModelImplCopyWithImpl<$Res>
    extends _$EcoleFilterModelCopyWithImpl<$Res, _$EcoleFilterModelImpl>
    implements _$$EcoleFilterModelImplCopyWith<$Res> {
  __$$EcoleFilterModelImplCopyWithImpl(
    _$EcoleFilterModelImpl _value,
    $Res Function(_$EcoleFilterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EcoleFilterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? villes = null,
    Object? domaines = null,
    Object? types = null,
  }) {
    return _then(
      _$EcoleFilterModelImpl(
        villes: null == villes
            ? _value._villes
            : villes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        domaines: null == domaines
            ? _value._domaines
            : domaines // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        types: null == types
            ? _value._types
            : types // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoleFilterModelImpl implements _EcoleFilterModel {
  const _$EcoleFilterModelImpl({
    final List<String> villes = const <String>[],
    final List<String> domaines = const <String>[],
    final List<String> types = const <String>[],
  }) : _villes = villes,
       _domaines = domaines,
       _types = types;

  factory _$EcoleFilterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoleFilterModelImplFromJson(json);

  final List<String> _villes;
  @override
  @JsonKey()
  List<String> get villes {
    if (_villes is EqualUnmodifiableListView) return _villes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_villes);
  }

  final List<String> _domaines;
  @override
  @JsonKey()
  List<String> get domaines {
    if (_domaines is EqualUnmodifiableListView) return _domaines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domaines);
  }

  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'EcoleFilterModel(villes: $villes, domaines: $domaines, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoleFilterModelImpl &&
            const DeepCollectionEquality().equals(other._villes, _villes) &&
            const DeepCollectionEquality().equals(other._domaines, _domaines) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_villes),
    const DeepCollectionEquality().hash(_domaines),
    const DeepCollectionEquality().hash(_types),
  );

  /// Create a copy of EcoleFilterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcoleFilterModelImplCopyWith<_$EcoleFilterModelImpl> get copyWith =>
      __$$EcoleFilterModelImplCopyWithImpl<_$EcoleFilterModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EcoleFilterModelImplToJson(this);
  }
}

abstract class _EcoleFilterModel implements EcoleFilterModel {
  const factory _EcoleFilterModel({
    final List<String> villes,
    final List<String> domaines,
    final List<String> types,
  }) = _$EcoleFilterModelImpl;

  factory _EcoleFilterModel.fromJson(Map<String, dynamic> json) =
      _$EcoleFilterModelImpl.fromJson;

  @override
  List<String> get villes;
  @override
  List<String> get domaines;
  @override
  List<String> get types;

  /// Create a copy of EcoleFilterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoleFilterModelImplCopyWith<_$EcoleFilterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
