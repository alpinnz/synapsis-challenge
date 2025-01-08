import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/domain/entities/user/user.dart';
import 'package:synapsis/app/domain/use_cases/device_get_device_by_id_use_case.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final DeviceGetDeviceByIdUseCase deviceGetDeviceByIdUseCase;

  AppCubit({required this.deviceGetDeviceByIdUseCase}) : super(const AppState());

  void setDevice(Device device) {
    emit(state.copyWith(device: state.device.copyWith(status: Status.success(), data: device)));
  }

  void setUser(User user) {
    emit(state.copyWith(user: state.user.copyWith(status: Status.success(), data: user)));
  }

// void onGetDevice() async {
//   try {
//     emit(state.copyWith(device: state.device.copyWith(status: Status.loading(), data: null)));
//     final deviceId = await DeviceUtils.getDeviceId();
//     final params = DeviceGetDeviceByIdUseCaseParams(deviceId: deviceId);
//     final res = await deviceGetDeviceByIdUseCase.execute(params: params);
//     switch (res) {
//       case Success(value: final value):
//         {
//           emit(state.copyWith(device: state.device.copyWith(status: Status.success(), data: res.value)));
//         }
//       case Failure():
//         {
//           emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: res.exception.message, exception: res.exception), data: null)));
//         }
//     }
//   } on BaseException catch (err) {
//     emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: err.message, exception: err), data: null)));
//   } catch (err) {
//     final exception = ClientException(message: err.toString());
//     emit(state.copyWith(device: state.device.copyWith(status: Status.failure(message: exception.message, exception: exception), data: null)));
//   }
// }
}
