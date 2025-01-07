part of 'register_device_cubit.dart';

@freezed
class RegisterDeviceState with _$RegisterDeviceState {
  const RegisterDeviceState._();

  const factory RegisterDeviceState({
    @Default(0) double progressPercent,
  }) = _RegisterDeviceState;
}
