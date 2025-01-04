import 'package:go_router/go_router.dart';
import 'package:synapsis/app/core/router/app_router.dart';
import 'package:synapsis/app/features/auth/presentation/pages/splash_page/splash_page.dart';
import 'package:synapsis/app/shared/models/router_data/router_data.dart';

class AuthRouter implements Router {
  static RouterData splash = RouterData(name: "Splash", path: "/");

  @override
  List<GoRoute> routes() {
    return [
      GoRoute(
        name: splash.name,
        path: splash.path,
        builder: (context, state) => SplashPage(),
      ),
    ];
  }
}
