part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(CubitState<Message>(status: Status.initial())) CubitState<Message> createMessages,
    @Default(CubitState<List<Message>>(status: Status.initial(), data: [])) CubitState<List<Message>> getMessages,
    @Default(CubitState<List<MessageTemplate>>(status: Status.initial(), data: [])) CubitState<List<MessageTemplate>> getMessagesTemplate,
    MessageTemplate? messageTemplateSelected,
  }) = _ChatState;
}
