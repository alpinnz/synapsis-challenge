import 'package:go_router/go_router.dart';
import 'package:synapsis/app/features/auth/auth_router.dart';

abstract interface class Router {
  List<GoRoute> routes() => [];
}

class AppRouter {
  final router = GoRouter(
    routes: [
      ...AuthRouter().routes(),
    ],
  );
}
