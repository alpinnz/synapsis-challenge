part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(CubitState<User>(status: Status.initial())) CubitState<User> user,
    @Default(CubitState<Device>(status: Status.initial())) CubitState<Device> device,
  }) = _AppState;
}
