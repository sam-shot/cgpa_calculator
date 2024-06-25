import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/components/input.dart';
import 'package:cgpa_calculator/ui/views/auth/controller/auth_controller.dart';
import 'package:cgpa_calculator/ui/views/auth/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fnController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  "SIGNUP",
                  style: context.bold22,
                ),
                const Gap(50),
                Text(
                  "Full Name",
                  style: context.normal14,
                ),
                const Gap(5),
                AppTextField(
                  controller: _fnController,
                  bgColor: Colors.transparent,
                  hint: "John Doe",
                ),
                const Gap(20),
                Text(
                  "Email",
                  style: context.normal14,
                ),
                const Gap(5),
                AppTextField(
                  controller: _emailController,
                  bgColor: Colors.transparent,
                  hint: "johndoe@gmail.com",
                ),
                const Gap(20),
                Text(
                  "Password",
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
                  text: "Sign up",
                  loading: ref.watch(authController).loading,
                  onPressed: () => ref.read(authController).signUp(
                        SignupModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                            fullName: _fnController.text),
                      ),
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
