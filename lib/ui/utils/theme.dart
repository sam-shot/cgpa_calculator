import 'package:cgpa_calculator/core/extensions/theme.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//// CONTROLLER CLASS

final themeProvider = ChangeNotifierProvider<AppThemeController>((ref) {
  return AppThemeController(ref);
});

class AppThemeController extends ChangeNotifier {
  final Ref ref;
  AppThemeController(this.ref) {
    isDark = false;
  }

  bool isDark = false;
  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

//// THEME CLASS

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBg,
    textTheme: TextTheme(
      titleMedium: [22, AppColors.white, FontWeight.w600].toTxtSty,
      titleSmall: [20, AppColors.white, FontWeight.w600].toTxtSty,
      titleLarge: [35, AppColors.white, FontWeight.w600].toTxtSty,
      bodyLarge: [18, AppColors.white, FontWeight.w600].toTxtSty,
      bodyMedium: [16, AppColors.white, FontWeight.w600].toTxtSty,
      bodySmall: [16, AppColors.white, FontWeight.w500].toTxtSty,
      labelSmall: [14, AppColors.white, FontWeight.w400].toTxtSty,
      labelMedium: [16, AppColors.white, FontWeight.w400].toTxtSty,
      labelLarge: [18, AppColors.white, FontWeight.w400].toTxtSty,
    ),
    primaryTextTheme: TextTheme(
      titleMedium: [22, AppColors.primaryDark, FontWeight.w600].toTxtSty,
      titleSmall: [20, AppColors.primaryDark, FontWeight.w600].toTxtSty,
      titleLarge: [35, AppColors.primaryDark, FontWeight.w600].toTxtSty,
      bodyLarge: [18, AppColors.primaryDark, FontWeight.w600].toTxtSty,
      bodyMedium: [16, AppColors.primaryDark, FontWeight.w600].toTxtSty,
      bodySmall: [16, AppColors.primaryDark, FontWeight.w500].toTxtSty,
      labelSmall: [14, AppColors.primaryDark, FontWeight.w400].toTxtSty,
      labelMedium: [16, AppColors.primaryDark, FontWeight.w400].toTxtSty,
      labelLarge: [18, AppColors.primaryDark, FontWeight.w400].toTxtSty,
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    primaryColor: AppColors.primaryDark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  /// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBg,
    textTheme: TextTheme(
      titleMedium: [22, AppColors.black, FontWeight.w600].toTxtSty,
      titleSmall: [20, AppColors.black, FontWeight.w600].toTxtSty,
      titleLarge: [35, AppColors.black, FontWeight.w600].toTxtSty,
      bodyLarge: [18, AppColors.black, FontWeight.w600].toTxtSty,
      bodyMedium: [16, AppColors.black, FontWeight.w600].toTxtSty,
      bodySmall: [16, AppColors.black, FontWeight.w500].toTxtSty,
      labelSmall: [14, AppColors.black, FontWeight.w400].toTxtSty,
      labelMedium: [16, AppColors.black, FontWeight.w400].toTxtSty,
      labelLarge: [18, AppColors.black, FontWeight.w400].toTxtSty,
    ),
    primaryTextTheme: TextTheme(
      titleMedium: [22, AppColors.primary, FontWeight.w600].toTxtSty,
      titleSmall: [20, AppColors.primary, FontWeight.w600].toTxtSty,
      titleLarge: [35, AppColors.primary, FontWeight.w600].toTxtSty,
      bodyLarge: [18, AppColors.primary, FontWeight.w600].toTxtSty,
      bodyMedium: [16, AppColors.primary, FontWeight.w600].toTxtSty,
      bodySmall: [16, AppColors.primary, FontWeight.w500].toTxtSty,
      labelSmall: [14, AppColors.primary, FontWeight.w400].toTxtSty,
      labelMedium: [16, AppColors.primary, FontWeight.w400].toTxtSty,
      labelLarge: [18, AppColors.primary, FontWeight.w400].toTxtSty,
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary, brightness: Brightness.light),
    primaryColor: AppColors.primaryLight,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
