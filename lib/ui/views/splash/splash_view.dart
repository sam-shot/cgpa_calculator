// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/extensions/string.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/auth/auth_view.dart';
import 'package:cgpa_calculator/ui/views/bottom_nav/bottom_nav.dart';
import 'package:cgpa_calculator/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late StreamSubscription authSubscription;
  @override
  void initState() {
    super.initState();
    _navigateIfAuthenticated();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  void _navigateIfAuthenticated() {
    Future(() {
      authSubscription = locator<SupabaseClient>()
          .auth
          .onAuthStateChange
          .listen((session) async {
        final user = session.session?.user;
        if (!mounted) {
          authSubscription.cancel();
          return;
        }
        if (user != null) {
          await ref.read(homeController).loadUser();
          context.replace(BottomNavWidget(
            index: 1,
          ));
        } else {
          context.replace(const AuthView());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!moved) {
    //   Future(() => ref.read(historyController.notifier).init());
    //   _move(context);
    // }
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "faculty_logo".png,
                width: 112.w,
              ),
              const Gap(30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "EDUCATIONAL\nTECHNOLOGY",
                  style: AppTextStyles.bold(35),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  " UNIVERSITY OF ILORIN\nGP CALCULATOR",
                  style: AppTextStyles.bold(20),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(20),
              Container(
                color: AppColors.white,
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _move(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   context.replace(const AuthView());
  //   moved = true;
  // }
}
