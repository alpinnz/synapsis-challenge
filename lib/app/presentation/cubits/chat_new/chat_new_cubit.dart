import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_new_cubit.freezed.dart';
part 'chat_new_state.dart';

class ChatNewCubit extends Cubit<ChatNewState> {
  ChatNewCubit() : super(const ChatNewState());
}
