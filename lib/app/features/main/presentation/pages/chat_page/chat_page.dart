import 'package:flutter/material.dart';
import 'package:synapsis/app/features/main/presentation/pages/chat_page/chat_tablet_page.dart';
import 'package:synapsis/app/shared/base/b_layout.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BLayout(
      desktop: (context, orientation) => const ChatTabletPage(),
      tablet: (context, orientation) => const ChatTabletPage(),
      mobile: (context, orientation) => const ChatTabletPage(),
    );
  }
}
