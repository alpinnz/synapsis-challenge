// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  CubitState<User> get login => throw _privateConstructorUsedError;
  CubitState<Device> get device => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({CubitState<User> login, CubitState<Device> device});

  $CubitStateCopyWith<User, $Res> get login;
  $CubitStateCopyWith<Device, $Res> get device;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as CubitState<User>,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CubitState<Device>,
    ) as $Val);
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<User, $Res> get login {
    return $CubitStateCopyWith<User, $Res>(_value.login, (value) {
      return _then(_value.copyWith(login: value) as $Val);
    });
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CubitStateCopyWith<Device, $Res> get device {
    return $CubitStateCopyWith<Device, $Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CubitState<User> login, CubitState<Device> device});

  @override
  $CubitStateCopyWith<User, $Res> get login;
  @override
  $CubitStateCopyWith<Device, $Res> get device;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? device = null,
  }) {
    return _then(_$LoginStateImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as CubitState<User>,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as CubitState<Device>,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.login = const CubitState<User>(status: Status.initial()),
      this.device = const CubitState<Device>(status: Status.initial())});

  @override
  @JsonKey()
  final CubitState<User> login;
  @override
  @JsonKey()
  final CubitState<Device> device;

  @override
  String toString() {
    return 'LoginState(login: $login, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, login, device);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final CubitState<User> login,
      final CubitState<Device> device}) = _$LoginStateImpl;

  @override
  CubitState<User> get login;
  @override
  CubitState<Device> get device;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
