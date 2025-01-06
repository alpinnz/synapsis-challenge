// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waiting_activation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WaitingActivationState {
  CubitState<dynamic> get register => throw _privateConstructorUsedError;

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaitingActivationStateCopyWith<WaitingActivationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitingActivationStateCopyWith<$Res> {
  factory $WaitingActivationStateCopyWith(WaitingActivationState value,
          $Res Function(WaitingActivationState) then) =
      _$WaitingActivationStateCopyWithImpl<$Res, WaitingActivationState>;
  @useResult
  $Res call({CubitState<dynamic> register});

  $CubitStateCopyWith<dynamic, $Res> get register;
}

/// @nodoc
class _$WaitingActivationStateCopyWithImpl<$Res,
        $Val extends WaitingActivationState>
    implements $WaitingActivationStateCopyWith<$Res> {
  _$WaitingActivationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
  }) {
    return _then(_value.copyWith(
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as CubitState<dynamic>,
    ) as $Val);
  }

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<dynamic, $Res> get register {
    return $CubitStateCopyWith<dynamic, $Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WaitingActivationStateImplCopyWith<$Res>
    implements $WaitingActivationStateCopyWith<$Res> {
  factory _$$WaitingActivationStateImplCopyWith(
          _$WaitingActivationStateImpl value,
          $Res Function(_$WaitingActivationStateImpl) then) =
      __$$WaitingActivationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CubitState<dynamic> register});

  @override
  $CubitStateCopyWith<dynamic, $Res> get register;
}

/// @nodoc
class __$$WaitingActivationStateImplCopyWithImpl<$Res>
    extends _$WaitingActivationStateCopyWithImpl<$Res,
        _$WaitingActivationStateImpl>
    implements _$$WaitingActivationStateImplCopyWith<$Res> {
  __$$WaitingActivationStateImplCopyWithImpl(
      _$WaitingActivationStateImpl _value,
      $Res Function(_$WaitingActivationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
  }) {
    return _then(_$WaitingActivationStateImpl(
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as CubitState<dynamic>,
    ));
  }
}

/// @nodoc

class _$WaitingActivationStateImpl extends _WaitingActivationState {
  const _$WaitingActivationStateImpl(
      {this.register = const CubitState(status: Status.initial())})
      : super._();

  @override
  @JsonKey()
  final CubitState<dynamic> register;

  @override
  String toString() {
    return 'WaitingActivationState(register: $register)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitingActivationStateImpl &&
            (identical(other.register, register) ||
                other.register == register));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register);

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitingActivationStateImplCopyWith<_$WaitingActivationStateImpl>
      get copyWith => __$$WaitingActivationStateImplCopyWithImpl<
          _$WaitingActivationStateImpl>(this, _$identity);
}

abstract class _WaitingActivationState extends WaitingActivationState {
  const factory _WaitingActivationState({final CubitState<dynamic> register}) =
      _$WaitingActivationStateImpl;
  const _WaitingActivationState._() : super._();

  @override
  CubitState<dynamic> get register;

  /// Create a copy of WaitingActivationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaitingActivationStateImplCopyWith<_$WaitingActivationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
