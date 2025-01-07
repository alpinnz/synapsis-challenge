import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synapsis/app/shared/models/cubit_state/cubit_state.dart';
import 'package:synapsis/app/shared/models/status/status.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onLogin() async {
    emit(state.copyWith(login: state.login.copyWith(status: Status.loading())));
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(login: state.login.copyWith(status: Status.success())));
  }
}
