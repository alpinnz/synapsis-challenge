import 'package:flutter/material.dart';

class ThemeTextStyle extends TextStyle {
  /// Bold FontWeight.w700
  /// SemiBold FontWeight.w600
  /// Regular FontWeight.w400
  /// FontStyle.normal / FontStyle.italic
  /// TextDecoration.underline, TextDecoration.lineThrough, TextDecoration.overline, TextDecoration.none
  /// TextDecorationStyle.dashed, TextDecorationStyle.dotted, TextDecorationStyle.double, TextDecorationStyle.solid, TextDecorationStyle.wavy
  const ThemeTextStyle._({
    super.fontWeight,
    super.fontSize,
    super.height,
    super.color,
    super.fontFamily,
  }) : super();

  // Head

  factory ThemeTextStyle.custom({required String? fontFamily, required Color color, required FontWeight fontWeight, required double fontSize}) {
    return ThemeTextStyle._(fontFamily: fontFamily, fontWeight: fontWeight, color: color, fontSize: fontSize, height: 1.5);
  }
}
