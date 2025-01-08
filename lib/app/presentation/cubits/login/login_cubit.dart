import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/use_cases/auth_on_login_tablet_unit.dart';
import 'package:synapsis/app/domain/use_cases/device_get_device_by_id_use_case.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';
import 'package:synapsis/app/shared/utils/device_utis.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthOnLoginTabletUnit authOnLoginTabletUnit;
  DeviceGetDeviceByIdUseCase deviceGetDeviceByIdUseCase;

  LoginCubit({required this.authOnLoginTabletUnit, required this.deviceGetDeviceByIdUseCase}) : super(const LoginState());

  void onLogin({required String nik}) async {
    try {
      if (state.login.status.isLoading || state.device.status.isLoading) return;
      emit(state.copyWith(login: state.login.copyWith(status: Status.loading())));

      if (state.device.data?.equipment?.id == null) {
        await onGetDevice();
      }

      final params = AuthOnLoginTabletUnitParams(unitId: state.device.data?.equipment?.id ?? "", nik: nik);
      final res = await authOnLoginTabletUnit.execute(params: params);
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(login: state.login.copyWith(status: Status.success(), data: value)));
          }
        case Failure(exception: final exception):
          {
            emit(state.copyWith(login: state.login.copyWith(status: Status.failure(message: exception.message, exception: exception))));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(login: state.login.copyWith(status: Status.failure(message: err.message, exception: err))));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(login: state.login.copyWith(status: Status.failure(message: exception.message, exception: exception))));
    }
  }

  Future<void> onGetDevice() async {
    try {
      emit(state.copyWith(device: state.device.copyWith(status: Status.loading())));
      final deviceId = await DeviceUtils.getDeviceId();
      final params = DeviceGetDeviceByIdUseCaseParams(deviceId: deviceId);
      final res = await deviceGetDeviceByIdUseCase.execute(params: params);
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(device: state.device.copyWith(status: Status.success(), data: value)));
          }
        case Failure(exception: final exception):
          {
            emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: exception.message, exception: exception))));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: err.message, exception: err))));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: exception.message, exception: exception))));
    }
  }
}
