import 'package:flutter/material.dart';
import 'package:synapsis/app/presentation/pages/register_device_page/register_device_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class RegisterDevicePage extends StatelessWidget {
  const RegisterDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const RegisterDeviceTabletPage(),
      tablet: (context, orientation) => const RegisterDeviceTabletPage(),
      mobile: (context, orientation) => const RegisterDeviceTabletPage(),
    );
  }
}
