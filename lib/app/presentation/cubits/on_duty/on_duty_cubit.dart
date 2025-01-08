import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel.dart';
import 'package:synapsis/app/data/models/message_message/message_model.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';

part 'on_duty_cubit.freezed.dart';
part 'on_duty_state.dart';

class OnDutyCubit extends Cubit<OnDutyState> {
  SocketChannel socketChannel;

  OnDutyCubit({required this.socketChannel}) : super(const OnDutyState());

  void onInitial({required String equipmentId}) async {
    await socketChannel.initialize();
    final channel = UrlConstants.socketChannelMonitoringMessagesEquipments.replaceAll("{equipment_id}", equipmentId);
    socketChannel.subscribe(channel, (res) {
      try {
        final data = MessageModel.fromJson(json.decode(res));
        emit(state.copyWith(socketMessage: data.toEntity()));
      } catch (_) {}
    });
  }

  @override
  Future<void> close() async {
    socketChannel.close();
    super.close();
  }
}
