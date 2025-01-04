import 'package:flutter/material.dart';

/// Types of ScreenBuilder
typedef ScreenBuilder = Widget Function(BuildContext context, Orientation orientation);

class BLayout extends StatelessWidget {
  const BLayout({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final ScreenBuilder desktop;
  final ScreenBuilder tablet;
  final ScreenBuilder mobile;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final width = MediaQuery.of(context).size.width;
        return switch (width) {
          <= 766 => mobile(context, orientation),
          >= 767 && <= 1023 => tablet(context, orientation),
          >= 1024 => desktop(context, orientation),
          _ => Center(child: Text("NO_FOUND")),
        };
      },
    );
  }
}
