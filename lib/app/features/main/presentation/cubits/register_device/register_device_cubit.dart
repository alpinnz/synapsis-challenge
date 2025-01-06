import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_cubit.freezed.dart';
part 'register_device_state.dart';

class RegisterDeviceCubit extends Cubit<RegisterDeviceState> {
  RegisterDeviceCubit() : super(const RegisterDeviceState());
  Timer? timer;

  void onInitial() async {
    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      log('Percent Update');

      double percent = state.progressPercent + 10;
      if (percent >= 100) {
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
