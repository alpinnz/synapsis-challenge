import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel.dart';
import 'package:synapsis/app/data/models/device_model/device_model.dart';
import 'package:synapsis/app/domain/entities/device/device.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';
import 'package:synapsis/app/shared/utils/device_utis.dart';

part 'waiting_activation_cubit.freezed.dart';
part 'waiting_activation_state.dart';

class WaitingActivationCubit extends Cubit<WaitingActivationState> {
  final SocketChannel socketChannel;

  WaitingActivationCubit({required this.socketChannel}) : super(const WaitingActivationState());

  void onInitial() async {
    emit(state.copyWith(activation: state.activation.copyWith(status: Status.loading())));
    await socketChannel.initialize();
    String deviceId = await DeviceUtils.getDeviceId();
    final channel = UrlConstants.socketChannelEquipmentsDevicesActivated.replaceAll("{device_id}", deviceId);
    socketChannel.subscribe(channel, (res) {
      try {
        final data = DeviceModel.fromJson(jsonDecode(res));
        if (data.isActive) {
          emit(state.copyWith(activation: state.activation.copyWith(status: Status.success(), data: data.toEntity())));
        }

        emit(state.copyWith(activation: state.activation.copyWith(status: Status.loading())));
      } catch (err) {
        emit(state.copyWith(activation: state.activation.copyWith(status: Status.failure())));
      }
    });
  }

  @override
  Future<void> close() async {
    socketChannel.close();
    super.close();
  }
}
