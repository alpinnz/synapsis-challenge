import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel_impl.dart';
import 'package:synapsis/app/data/data_sources/device_data_source/device_remote_data_source.dart';
import 'package:synapsis/app/data/repositories/device_repository_impl.dart';
import 'package:synapsis/app/domain/repositories/device_repository.dart';
import 'package:synapsis/app/domain/use_cases/device_get_device_by_id_use_case.dart';
import 'package:synapsis/app/presentation/cubits/app/app_cubit.dart';
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

    injector.registerLazySingleton<http.Client>(() => http.Client());

    // service
    injector.registerFactory<SocketChannel>(() => SocketChannelImpl());

    // data sources
    injector.registerLazySingleton<DeviceRemoteDataSource>(() => DeviceRemoteDataSourceImpl(httpClient: injector()));

    // repositories
    injector.registerLazySingleton<DeviceRepository>(() => DeviceRepositoryImpl(deviceRemoteDataSource: injector()));

    // use cases
    injector.registerFactory<DeviceGetDeviceByIdUseCase>(() => DeviceGetDeviceByIdUseCase(deviceRepository: injector()));

    injector.registerFactory<RegisterDeviceCubit>(() => RegisterDeviceCubit(deviceGetDeviceByIdUseCase: injector()));

    injector.registerFactory<WaitingActivationCubit>(() => WaitingActivationCubit(socketChannel: injector()));
    injector.registerFactory<LoginCubit>(() => LoginCubit());
    injector.registerFactory<AppCubit>(() => AppCubit());
    injector.registerFactory<OnDutyCubit>(() => OnDutyCubit());
    injector.registerFactory<ChatCubit>(() => ChatCubit());
    injector.registerFactory<ChatNewCubit>(() => ChatNewCubit());
    // log('success', name: 'APP_INJECTOR-initializeDependencies');
  }
}
