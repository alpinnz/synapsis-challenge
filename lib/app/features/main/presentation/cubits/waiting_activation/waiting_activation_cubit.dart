import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';

part 'waiting_activation_cubit.freezed.dart';
part 'waiting_activation_state.dart';

class WaitingActivationCubit extends Cubit<WaitingActivationState> {
  WaitingActivationCubit() : super(const WaitingActivationState());

  void onInitial() async {
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(register: state.register.copyWith(status: Status.success())));
  }
}
