import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/extensions/string.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/views/auth/login_view.dart';
import 'package:cgpa_calculator/ui/views/auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    "character".png,
                    width: 300.w,
                  ),
                ),
              ),
              AppButton(
                text: "Login",
                color: context.primaryColor,
                textColor: AppColors.white,
                onPressed: () => context.push(const LoginView()),
              ),
              const Gap(10),
              AppButton(
                text: "Sign up",
                color: context.primaryColor,
                type: ButtonType.outlined,
                onPressed: () => context.push(const SignupView()),
              ),
              const Gap(20),
              const Divider(),
              const Gap(20),
              AppButton(
                text: "Continue with Google",
                icon: const Icon(Icons.lock),
                color: context.primaryColor,
                type: ButtonType.outlined,
                onPressed: () => context.push(const SignupView()),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
