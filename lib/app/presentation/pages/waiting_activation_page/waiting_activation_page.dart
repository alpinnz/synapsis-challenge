import 'package:flutter/material.dart';
import 'package:synapsis/app/presentation/pages/waiting_activation_page/waiting_activation_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class WaitingActivationPage extends StatelessWidget {
  const WaitingActivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const WaitingActivationTabletPage(),
      tablet: (context, orientation) => const WaitingActivationTabletPage(),
      mobile: (context, orientation) => const WaitingActivationTabletPage(),
    );
  }
}
