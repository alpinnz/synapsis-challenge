import 'package:flutter/material.dart';
import 'package:synapsis/app/app.dart';
import 'package:synapsis/app/core/di/app_injector.dart';

Future<void> main() async {
  // Bloc.observer = AppBlocObserver();
  await AppInjector().initializeDependencies();
  runApp(App());
}
