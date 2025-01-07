import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/use_cases/device_get_device_by_id_use_case.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';
import 'package:synapsis/app/shared/utils/device_utis.dart';

part 'register_device_cubit.freezed.dart';
part 'register_device_state.dart';

class RegisterDeviceCubit extends Cubit<RegisterDeviceState> {
  final DeviceGetDeviceByIdUseCase deviceGetDeviceByIdUseCase;

  RegisterDeviceCubit({required this.deviceGetDeviceByIdUseCase}) : super(const RegisterDeviceState());
  Timer? timer;

  void onInitial() async {
    onProgressStart();
    onGetDevice();
  }

  void onGetDevice() async {
    try {
      emit(state.copyWith(device: state.device.copyWith(status: Status.loading(), data: null)));
      final deviceId = await DeviceUtils.getDeviceId();
      final params = DeviceGetDeviceByIdUseCaseParams(deviceId: deviceId);
      final res = await deviceGetDeviceByIdUseCase.execute(params: params);
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(device: state.device.copyWith(status: Status.success(), data: res.value)));
          }
        case Failure():
          {
            emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: res.exception.message, exception: res.exception), data: null)));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: err.message, exception: err), data: null)));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: exception.message, exception: exception), data: null)));
    }
  }

  void onProgressStart() async {
    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      double percent = state.progressPercent + 1;
      if (state.device.status.isSuccess || state.device.status.isFailure) {
        percent = state.progressPercent + 25;
      }
      if (percent >= 100) {
        percent = 100;
        timer?.cancel();
      }
      emit(state.copyWith(progressPercent: percent));
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
