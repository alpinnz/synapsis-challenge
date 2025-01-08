import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synapsis/app/app.dart';
import 'package:synapsis/app/core/bloc/app_bloc.dart';
import 'package:synapsis/app/core/di/app_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await AppInjector().initializeDependencies();
  runApp(App());
}
