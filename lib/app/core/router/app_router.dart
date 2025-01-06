import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:synapsis/app/core/di/app_injector.dart';
import 'package:synapsis/app/features/main/main_router.dart';

abstract interface class Router {
  List<RouteBase> routes() => [];
}

final appRouter = injector<AppRouter>();

final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingsNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> chartNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> chatNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> onDutyNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: MainRouter.registerDevice.path,
    routes: [
      ...MainRouter().routes(),
    ],
  );

  static Page getPage({required Widget child, required GoRouterState state}) {
    return MaterialPage(key: state.pageKey, child: child);
  }
}
