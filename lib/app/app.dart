import 'package:flutter/material.dart';
import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: injector<AppRouter>().router,
    );
  }
}
