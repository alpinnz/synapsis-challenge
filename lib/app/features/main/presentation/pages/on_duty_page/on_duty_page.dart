import 'package:flutter/material.dart';
import 'package:synapsis/app/features/main/presentation/pages/on_duty_page/on_duty_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class OnDutyPage extends StatelessWidget {
  const OnDutyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const OnDutyTabletPage(),
      tablet: (context, orientation) => const OnDutyTabletPage(),
      mobile: (context, orientation) => const OnDutyTabletPage(),
    );
  }
}
