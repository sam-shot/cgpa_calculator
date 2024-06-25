import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/ui/utils/theme.dart';
import 'package:cgpa_calculator/ui/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'CGPA Calculator',
          debugShowCheckedModeBanner: false,
          home: child,
          themeMode: ref.watch(themeProvider).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
        );
      },
      child: const SplashView(),
    );
  }
}
