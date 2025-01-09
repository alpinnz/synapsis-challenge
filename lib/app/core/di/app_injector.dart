import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis/app/core/api/api.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel_impl.dart';
import 'package:synapsis/app/data/data_sources/auth_data_source/auth_remote_data_source.dart';
import 'package:synapsis/app/data/data_sources/device_data_source/device_remote_data_source.dart';
import 'package:synapsis/app/data/data_sources/message_data_source/message_remote_data_source.dart';
import 'package:synapsis/app/data/repositories/auth_repository_impl.dart';
import 'package:synapsis/app/data/repositories/device_repository_impl.dart';
import 'package:synapsis/app/data/repositories/message_repository_impl.dart';
import 'package:synapsis/app/domain/repositories/auth_repository.dart';
import 'package:synapsis/app/domain/repositories/device_repository.dart';
import 'package:synapsis/app/domain/repositories/message_repository.dart';
import 'package:synapsis/app/domain/use_cases/auth_on_login_tablet_unit.dart';
import 'package:synapsis/app/domain/use_cases/device_get_device_by_id_use_case.dart';
import 'package:synapsis/app/domain/use_cases/mesage_create_message.dart';
import 'package:synapsis/app/domain/use_cases/mesage_get_messages.dart';
import 'package:synapsis/app/domain/use_cases/mesage_get_messages_template.dart';
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
    final sp = await SharedPreferences.getInstance();
    injector.registerLazySingleton<SharedPreferences>(() => sp);
    injector.registerLazySingleton<http.Client>(() => http.Client());
    injector.registerLazySingleton<Api>(() => ApiImpl(httpClient: injector(), sharedPreferences: injector()));

    // service
    injector.registerFactory<SocketChannel>(() => SocketChannelImpl());

    // data sources
    injector.registerLazySingleton<DeviceRemoteDataSource>(() => DeviceRemoteDataSourceImpl(api: injector()));
    injector.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(api: injector()));
    injector.registerLazySingleton<MessageRemoteDataSource>(() => MessageRemoteDataSourceImpl(api: injector()));

    // repositories
    injector.registerLazySingleton<DeviceRepository>(() => DeviceRepositoryImpl(deviceRemoteDataSource: injector()));
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: injector()));
    injector.registerLazySingleton<MessageRepository>(() => MessageRepositoryImpl(messageRemoteDataSource: injector()));

    // use cases
    injector.registerFactory<DeviceGetDeviceByIdUseCase>(() => DeviceGetDeviceByIdUseCase(deviceRepository: injector()));
    injector.registerFactory<AuthOnLoginTabletUnit>(() => AuthOnLoginTabletUnit(authRepository: injector()));

    injector.registerFactory<MessageCreateMessages>(() => MessageCreateMessages(messageRepository: injector()));
    injector.registerFactory<MessageGetMessages>(() => MessageGetMessages(messageRepository: injector()));
    injector.registerFactory<MessageGetMessagesTemplate>(() => MessageGetMessagesTemplate(messageRepository: injector()));

    injector.registerFactory<RegisterDeviceCubit>(() => RegisterDeviceCubit(deviceGetDeviceByIdUseCase: injector()));

    injector.registerFactory<WaitingActivationCubit>(() => WaitingActivationCubit(socketChannel: injector()));
    injector.registerFactory<LoginCubit>(() => LoginCubit(deviceGetDeviceByIdUseCase: injector(), authOnLoginTabletUnit: injector()));
    injector.registerFactory<AppCubit>(() => AppCubit(deviceGetDeviceByIdUseCase: injector()));
    injector.registerFactory<OnDutyCubit>(() => OnDutyCubit(socketChannel: injector()));
    injector.registerFactory<ChatCubit>(
      () => ChatCubit(
        messageCreateMessages: injector(),
        messageGetMessages: injector(),
        messageGetMessagesTemplate: injector(),
      ),
    );
    injector.registerFactory<ChatNewCubit>(() => ChatNewCubit());
    // log('success', name: 'APP_INJECTOR-initializeDependencies');
  }
}
