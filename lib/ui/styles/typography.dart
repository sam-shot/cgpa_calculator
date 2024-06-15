import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static normal(num size) => TextStyle(
        color: AppColors.white,
        fontSize: size.sp.toDouble(),
        fontWeight: FontWeight.normal,
      );
  static bold(num size) => TextStyle(
        color: AppColors.white,
        fontSize: size.sp.toDouble(),
        fontWeight: FontWeight.w700,
      );
  static medium(num size) => TextStyle(
        color: AppColors.white,
        fontSize: size.sp.toDouble(),
        fontWeight: FontWeight.w500,
      );
}
