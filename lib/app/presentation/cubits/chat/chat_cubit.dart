import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/core/error/either.dart';
import 'package:synapsis/app/core/error/exception.dart';
import 'package:synapsis/app/domain/entities/message/message.dart';
import 'package:synapsis/app/domain/entities/message_template/message_template.dart';
import 'package:synapsis/app/domain/use_cases/mesage_create_message.dart';
import 'package:synapsis/app/domain/use_cases/mesage_get_messages.dart';
import 'package:synapsis/app/domain/use_cases/mesage_get_messages_template.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final MessageGetMessages messageGetMessages;
  final MessageCreateMessages messageCreateMessages;
  final MessageGetMessagesTemplate messageGetMessagesTemplate;

  ChatCubit({required this.messageGetMessages, required this.messageGetMessagesTemplate, required this.messageCreateMessages}) : super(const ChatState());

  void onInitial({required String equipmentId}) async {
    onGetMessages(equipmentId: equipmentId);
    onGetMessagesTemplate();
  }

  void onCreateMessages({required String message, required String equipmentId}) async {
    try {
      if (message.isEmpty) return;
      emit(state.copyWith(createMessages: state.createMessages.copyWith(status: Status.loading())));
      final params = MessageCreateMessagesParams(
        message: message,
        categoryId: state.messageTemplateSelected?.categoryId ?? "1",
        deviceType: "Mobile",
        equipmentId: equipmentId,
      );
      final res = await messageCreateMessages.execute(params: params);
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(
              createMessages: state.createMessages.copyWith(status: Status.success(), data: value),
              getMessages: state.getMessages.copyWith(data: [...(state.getMessages.data ?? []), value]),
            ));
          }
        case Failure(exception: final exception):
          {
            emit(state.copyWith(createMessages: state.createMessages.copyWith(status: Status.failure(message: exception.message, exception: exception))));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(createMessages: state.createMessages.copyWith(status: Status.failure(message: err.message, exception: err))));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(createMessages: state.createMessages.copyWith(status: Status.failure(message: exception.message, exception: exception))));
    }
  }

  void onGetMessages({required String equipmentId}) async {
    try {
      emit(state.copyWith(getMessages: state.getMessages.copyWith(status: Status.loading())));
      final params = MessageGetMessagesParams(page: 1, limit: 10, sort: "created_at,desc", equipmentId: equipmentId);
      final res = await messageGetMessages.execute(params: params);
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(getMessages: state.getMessages.copyWith(status: Status.success(), data: value)));
          }
        case Failure(exception: final exception):
          {
            emit(state.copyWith(getMessages: state.getMessages.copyWith(status: Status.failure(message: exception.message, exception: exception))));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(getMessages: state.getMessages.copyWith(status: Status.failure(message: err.message, exception: err))));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(getMessages: state.getMessages.copyWith(status: Status.failure(message: exception.message, exception: exception))));
    }
  }

  void onGetMessagesTemplate() async {
    try {
      emit(state.copyWith(getMessagesTemplate: state.getMessagesTemplate.copyWith(status: Status.loading())));
      final res = await messageGetMessagesTemplate.execute();
      switch (res) {
        case Success(value: final value):
          {
            emit(state.copyWith(getMessagesTemplate: state.getMessagesTemplate.copyWith(status: Status.success(), data: value)));
          }
        case Failure(exception: final exception):
          {
            emit(state.copyWith(
                getMessagesTemplate: state.getMessagesTemplate.copyWith(status: Status.failure(message: exception.message, exception: exception))));
          }
      }
    } on BaseException catch (err) {
      emit(state.copyWith(getMessagesTemplate: state.getMessagesTemplate.copyWith(status: Status.failure(message: err.message, exception: err))));
    } catch (err) {
      final exception = ClientException(message: err.toString());
      emit(state.copyWith(getMessagesTemplate: state.getMessagesTemplate.copyWith(status: Status.failure(message: exception.message, exception: exception))));
    }
  }

  void onMessageTemplateSelect(MessageTemplate e) {
    emit(state.copyWith(messageTemplateSelected: e));
  }
}
