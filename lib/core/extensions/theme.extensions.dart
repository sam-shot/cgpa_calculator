import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeExt on List {
  TextStyle get toTxtSty {
    return GoogleFonts.manrope(
      fontSize: (first as int).sp,
      color: this[1] as Color,
      fontWeight: this[2] as FontWeight,
    );
  }
}
