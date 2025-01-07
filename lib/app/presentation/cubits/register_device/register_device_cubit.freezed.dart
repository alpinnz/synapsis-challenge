// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_device_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterDeviceState {
  double get progressPercent => throw _privateConstructorUsedError;

  /// Create a copy of RegisterDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterDeviceStateCopyWith<RegisterDeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDeviceStateCopyWith<$Res> {
  factory $RegisterDeviceStateCopyWith(
          RegisterDeviceState value, $Res Function(RegisterDeviceState) then) =
      _$RegisterDeviceStateCopyWithImpl<$Res, RegisterDeviceState>;
  @useResult
  $Res call({double progressPercent});
}

/// @nodoc
class _$RegisterDeviceStateCopyWithImpl<$Res, $Val extends RegisterDeviceState>
    implements $RegisterDeviceStateCopyWith<$Res> {
  _$RegisterDeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressPercent = null,
  }) {
    return _then(_value.copyWith(
      progressPercent: null == progressPercent
          ? _value.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterDeviceStateImplCopyWith<$Res>
    implements $RegisterDeviceStateCopyWith<$Res> {
  factory _$$RegisterDeviceStateImplCopyWith(_$RegisterDeviceStateImpl value,
          $Res Function(_$RegisterDeviceStateImpl) then) =
      __$$RegisterDeviceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double progressPercent});
}

/// @nodoc
class __$$RegisterDeviceStateImplCopyWithImpl<$Res>
    extends _$RegisterDeviceStateCopyWithImpl<$Res, _$RegisterDeviceStateImpl>
    implements _$$RegisterDeviceStateImplCopyWith<$Res> {
  __$$RegisterDeviceStateImplCopyWithImpl(_$RegisterDeviceStateImpl _value,
      $Res Function(_$RegisterDeviceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressPercent = null,
  }) {
    return _then(_$RegisterDeviceStateImpl(
      progressPercent: null == progressPercent
          ? _value.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RegisterDeviceStateImpl extends _RegisterDeviceState {
  const _$RegisterDeviceStateImpl({this.progressPercent = 0}) : super._();

  @override
  @JsonKey()
  final double progressPercent;

  @override
  String toString() {
    return 'RegisterDeviceState(progressPercent: $progressPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDeviceStateImpl &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progressPercent);

  /// Create a copy of RegisterDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDeviceStateImplCopyWith<_$RegisterDeviceStateImpl> get copyWith =>
      __$$RegisterDeviceStateImplCopyWithImpl<_$RegisterDeviceStateImpl>(
          this, _$identity);
}

abstract class _RegisterDeviceState extends RegisterDeviceState {
  const factory _RegisterDeviceState({final double progressPercent}) =
      _$RegisterDeviceStateImpl;
  const _RegisterDeviceState._() : super._();

  @override
  double get progressPercent;

  /// Create a copy of RegisterDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterDeviceStateImplCopyWith<_$RegisterDeviceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
