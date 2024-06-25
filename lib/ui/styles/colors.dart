import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary = MaterialColor(0XFF0059D4, {
    100: Color(0XFF97C2FF),
    200: Color(0XFF0059D4),
  });
  static const MaterialColor primaryDark = MaterialColor(0XFF3780FD, {
    100: Color(0XFF071C38),
    200: Color(0XFF3780FD),
  });
  static Color primaryLight =
      const Color.fromARGB(255, 151, 194, 255).withOpacity(0.7);
  static const Color primaryThick = Color.fromARGB(255, 0, 55, 131);
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF000000);

  /// Theme Colors

  static Color darkBg = const Color.fromARGB(255, 0, 10, 18);
  static Color lightBg = const Color.fromARGB(255, 232, 245, 255);
}
