import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/ui/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'CGPA Calculator',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(),
        ),
      ),
    );
  }
}
