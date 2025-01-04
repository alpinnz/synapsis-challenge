// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CubitState<T> {
  T? get data => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CubitStateCopyWith<T, CubitState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CubitStateCopyWith<T, $Res> {
  factory $CubitStateCopyWith(
          CubitState<T> value, $Res Function(CubitState<T>) then) =
      _$CubitStateCopyWithImpl<T, $Res, CubitState<T>>;
  @useResult
  $Res call({T? data, Status status});
}

/// @nodoc
class _$CubitStateCopyWithImpl<T, $Res, $Val extends CubitState<T>>
    implements $CubitStateCopyWith<T, $Res> {
  _$CubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CubitStateImplCopyWith<T, $Res>
    implements $CubitStateCopyWith<T, $Res> {
  factory _$$CubitStateImplCopyWith(
          _$CubitStateImpl<T> value, $Res Function(_$CubitStateImpl<T>) then) =
      __$$CubitStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, Status status});
}

/// @nodoc
class __$$CubitStateImplCopyWithImpl<T, $Res>
    extends _$CubitStateCopyWithImpl<T, $Res, _$CubitStateImpl<T>>
    implements _$$CubitStateImplCopyWith<T, $Res> {
  __$$CubitStateImplCopyWithImpl(
      _$CubitStateImpl<T> _value, $Res Function(_$CubitStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? status = null,
  }) {
    return _then(_$CubitStateImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$CubitStateImpl<T> extends _CubitState<T> {
  const _$CubitStateImpl({this.data, this.status = const Status.initial()})
      : super._();

  @override
  final T? data;
  @override
  @JsonKey()
  final Status status;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CubitStateImplCopyWith<T, _$CubitStateImpl<T>> get copyWith =>
      __$$CubitStateImplCopyWithImpl<T, _$CubitStateImpl<T>>(this, _$identity);
}

abstract class _CubitState<T> extends CubitState<T> {
  const factory _CubitState({final T? data, final Status status}) =
      _$CubitStateImpl<T>;
  const _CubitState._() : super._();

  @override
  T? get data;
  @override
  Status get status;

  /// Create a copy of CubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CubitStateImplCopyWith<T, _$CubitStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
