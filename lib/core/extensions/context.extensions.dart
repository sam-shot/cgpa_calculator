import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  push<T extends Object>(Widget page) {
    return Navigator.push(
      this,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  pop() {
    return Navigator.pop(this);
  }

  replace<T extends Object>(Widget page) {
    return Navigator.pushReplacement(
      this,
      CupertinoPageRoute(builder: (context) => page),
    );
  }
}

extension UIThemeExtension on BuildContext {
  // * (default) TextTheme
  TextStyle get normal14 => Theme.of(this).textTheme.labelSmall!;
  TextStyle get normal16 => Theme.of(this).textTheme.labelMedium!;
  TextStyle get normal18 => Theme.of(this).textTheme.labelLarge!;
  TextStyle get medium16 => Theme.of(this).textTheme.bodySmall!;
  TextStyle get bold16 => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bold18 => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bold20 => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bold22 => Theme.of(this).textTheme.titleMedium!;
  TextStyle get bold35 => Theme.of(this).textTheme.titleLarge!;
  TextStyle get priNormal14 => Theme.of(this).primaryTextTheme.labelSmall!;
  TextStyle get priNormal16 => Theme.of(this).primaryTextTheme.labelMedium!;
  TextStyle get priNormal18 => Theme.of(this).primaryTextTheme.labelLarge!;
  TextStyle get priMedium16 => Theme.of(this).primaryTextTheme.bodySmall!;
  TextStyle get priBold16 => Theme.of(this).primaryTextTheme.bodyMedium!;
  TextStyle get priBold18 => Theme.of(this).primaryTextTheme.bodyLarge!;
  TextStyle get priBold20 => Theme.of(this).primaryTextTheme.titleSmall!;
  TextStyle get priBold22 => Theme.of(this).primaryTextTheme.titleMedium!;
  TextStyle get priBold35 => Theme.of(this).primaryTextTheme.titleLarge!;

  MaterialColor get primaryColor => Theme.of(this).brightness == Brightness.light ? AppColors.primary :AppColors.primaryDark;
}
