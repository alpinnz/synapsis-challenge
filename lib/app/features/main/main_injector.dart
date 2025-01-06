import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/features/main/presentation/cubits/chat/chat_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/chat_new/chat_new_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/login/login_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/on_duty/on_duty_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/register_device/register_device_cubit.dart';
import 'package:synapsis/app/features/main/presentation/cubits/waiting_activation/waiting_activation_cubit.dart';

class MainInjector implements Injector {
  @override
  Future<void> initializeDependencies() async {
    injector.registerFactory<RegisterDeviceCubit>(() => RegisterDeviceCubit());
    injector.registerFactory<WaitingActivationCubit>(() => WaitingActivationCubit());
    injector.registerFactory<LoginCubit>(() => LoginCubit());
    injector.registerFactory<OnDutyCubit>(() => OnDutyCubit());
    injector.registerFactory<ChatCubit>(() => ChatCubit());
    injector.registerFactory<ChatNewCubit>(() => ChatNewCubit());
  }
}
