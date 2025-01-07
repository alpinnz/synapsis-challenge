import 'package:flutter/material.dart';
import 'package:synapsis/app/presentation/pages/chat_new_page/chat_new_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class ChatNewPage extends StatelessWidget {
  const ChatNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const ChatNewTabletPage(),
      tablet: (context, orientation) => const ChatNewTabletPage(),
      mobile: (context, orientation) => const ChatNewTabletPage(),
    );
  }
}
