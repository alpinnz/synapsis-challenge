part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(CubitState(status: Status.initial())) CubitState<dynamic> login,
  }) = _LoginState;
}
