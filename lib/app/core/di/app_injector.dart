import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/features/main/main_injector.dart';

final injector = GetIt.instance;

abstract interface class Injector {
  Future<void> initializeDependencies() async => injector;
}

class AppInjector implements Injector {
  @override
  Future<void> initializeDependencies() async {
    injector.registerLazySingleton<AppRouter>(() => AppRouter());

    // auth
    await MainInjector().initializeDependencies();
    log('success', name: 'APP_INJECTOR-initializeDependencies');
  }
}
