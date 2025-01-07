import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/presentation/cubits/chat_new/chat_new_cubit.dart';
import 'package:synapsis/app/presentation/cubits/login/login_cubit.dart';
import 'package:synapsis/app/presentation/cubits/on_duty/on_duty_cubit.dart';
import 'package:synapsis/app/presentation/cubits/register_device/register_device_cubit.dart';
import 'package:synapsis/app/presentation/cubits/waiting_activation/waiting_activation_cubit.dart';

final injector = GetIt.instance;

class AppInjector {
  Future<void> initializeDependencies() async {
    injector.registerLazySingleton<AppRouter>(() => AppRouter());

    injector.registerFactory<RegisterDeviceCubit>(() => RegisterDeviceCubit());
    injector.registerFactory<WaitingActivationCubit>(() => WaitingActivationCubit());
    injector.registerFactory<LoginCubit>(() => LoginCubit());
    injector.registerFactory<OnDutyCubit>(() => OnDutyCubit());
    injector.registerFactory<ChatCubit>(() => ChatCubit());
    injector.registerFactory<ChatNewCubit>(() => ChatNewCubit());
    log('success', name: 'APP_INJECTOR-initializeDependencies');
  }
}
