// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_ecoles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaginatedEcolesModel _$PaginatedEcolesModelFromJson(Map<String, dynamic> json) {
  return _PaginatedEcolesModel.fromJson(json);
}

/// @nodoc
mixin _$PaginatedEcolesModel {
  List<EcoleModel> get items => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PaginatedEcolesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedEcolesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedEcolesModelCopyWith<PaginatedEcolesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedEcolesModelCopyWith<$Res> {
  factory $PaginatedEcolesModelCopyWith(
    PaginatedEcolesModel value,
    $Res Function(PaginatedEcolesModel) then,
  ) = _$PaginatedEcolesModelCopyWithImpl<$Res, PaginatedEcolesModel>;
  @useResult
  $Res call({
    List<EcoleModel> items,
    int currentPage,
    int lastPage,
    int perPage,
    int total,
  });
}

/// @nodoc
class _$PaginatedEcolesModelCopyWithImpl<
  $Res,
  $Val extends PaginatedEcolesModel
>
    implements $PaginatedEcolesModelCopyWith<$Res> {
  _$PaginatedEcolesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedEcolesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<EcoleModel>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            lastPage: null == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int,
            perPage: null == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginatedEcolesModelImplCopyWith<$Res>
    implements $PaginatedEcolesModelCopyWith<$Res> {
  factory _$$PaginatedEcolesModelImplCopyWith(
    _$PaginatedEcolesModelImpl value,
    $Res Function(_$PaginatedEcolesModelImpl) then,
  ) = __$$PaginatedEcolesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<EcoleModel> items,
    int currentPage,
    int lastPage,
    int perPage,
    int total,
  });
}

/// @nodoc
class __$$PaginatedEcolesModelImplCopyWithImpl<$Res>
    extends _$PaginatedEcolesModelCopyWithImpl<$Res, _$PaginatedEcolesModelImpl>
    implements _$$PaginatedEcolesModelImplCopyWith<$Res> {
  __$$PaginatedEcolesModelImplCopyWithImpl(
    _$PaginatedEcolesModelImpl _value,
    $Res Function(_$PaginatedEcolesModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginatedEcolesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(
      _$PaginatedEcolesModelImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<EcoleModel>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        lastPage: null == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int,
        perPage: null == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedEcolesModelImpl implements _PaginatedEcolesModel {
  const _$PaginatedEcolesModelImpl({
    final List<EcoleModel> items = const <EcoleModel>[],
    this.currentPage = 1,
    this.lastPage = 1,
    this.perPage = 15,
    this.total = 0,
  }) : _items = items;

  factory _$PaginatedEcolesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedEcolesModelImplFromJson(json);

  final List<EcoleModel> _items;
  @override
  @JsonKey()
  List<EcoleModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final int perPage;
  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'PaginatedEcolesModel(items: $items, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedEcolesModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    currentPage,
    lastPage,
    perPage,
    total,
  );

  /// Create a copy of PaginatedEcolesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedEcolesModelImplCopyWith<_$PaginatedEcolesModelImpl>
  get copyWith =>
      __$$PaginatedEcolesModelImplCopyWithImpl<_$PaginatedEcolesModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedEcolesModelImplToJson(this);
  }
}

abstract class _PaginatedEcolesModel implements PaginatedEcolesModel {
  const factory _PaginatedEcolesModel({
    final List<EcoleModel> items,
    final int currentPage,
    final int lastPage,
    final int perPage,
    final int total,
  }) = _$PaginatedEcolesModelImpl;

  factory _PaginatedEcolesModel.fromJson(Map<String, dynamic> json) =
      _$PaginatedEcolesModelImpl.fromJson;

  @override
  List<EcoleModel> get items;
  @override
  int get currentPage;
  @override
  int get lastPage;
  @override
  int get perPage;
  @override
  int get total;

  /// Create a copy of PaginatedEcolesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedEcolesModelImplCopyWith<_$PaginatedEcolesModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
