import 'package:flutter/material.dart';
import 'package:synapsis/app/presentation/pages/login_page/login_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const LoginTabletPage(),
      tablet: (context, orientation) => const LoginTabletPage(),
      mobile: (context, orientation) => const LoginTabletPage(),
    );
  }
}
