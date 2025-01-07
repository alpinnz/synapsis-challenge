part of 'waiting_activation_cubit.dart';

@freezed
class WaitingActivationState with _$WaitingActivationState {
  const WaitingActivationState._();

  const factory WaitingActivationState({
    @Default(CubitState(status: Status.initial())) CubitState<Device> activation,
  }) = _WaitingActivationState;
}
