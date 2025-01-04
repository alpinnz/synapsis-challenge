import 'package:flutter/material.dart';
import 'package:synapsis/app/features/auth/presentation/pages/splash_page/splash_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const SplashTabletPage(),
      tablet: (context, orientation) => const SplashTabletPage(),
      mobile: (context, orientation) => const SplashTabletPage(),
    );
  }
}
