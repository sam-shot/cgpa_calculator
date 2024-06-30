import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/components/input.dart';
import 'package:cgpa_calculator/ui/views/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  final String email;

  const ResetPasswordView({super.key, required this.email});

  @override
  ConsumerState<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                const Gap(20),
                Text(
                  "Reset Password",
                  style: context.bold22,
                ),
                const Gap(10),
                Text(
                  "An OTP code has been sent to your email, kindly check it to proceed.",
                  style: context.normal14.copyWith(
                      color: context.normal14.color!.withOpacity(0.7)),
                ),
                const Gap(50),
                Text(
                  "OTP Code",
                  style: context.normal14,
                ),
                const Gap(5),
                AppTextField(
                  controller: _otpController,
                  bgColor: Colors.transparent,
                  hint: "123456",
                ),
                const Gap(20),
                Text(
                  "New password",
                  style: context.normal14,
                ),
                const Gap(5),
                AppTextField(
                  controller: _passwordController,
                  bgColor: Colors.transparent,
                  hint: "********",
                  isPassword: true,
                ),
                const Gap(120),
                AppButton(
                  text: "Reset Password",
                  loading: ref.watch(authController).loading,
                  onPressed: () => ref.read(authController).resetPassword(
                      widget.email,
                      _passwordController.text,
                      _otpController.text),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
