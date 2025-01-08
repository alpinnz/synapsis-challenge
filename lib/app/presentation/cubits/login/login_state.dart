part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(CubitState<User>(status: Status.initial())) CubitState<User> login,
    @Default(CubitState<Device>(status: Status.initial())) CubitState<Device> device,
  }) = _LoginState;
}
