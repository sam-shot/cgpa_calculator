import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/components/input.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/views/auth/controller/auth_controller.dart';
import 'package:cgpa_calculator/ui/views/auth/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _emailController = TextEditingController();
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
                  "LOGIN",
                  style: context.bold22,
                ),
                const Gap(50),
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
                  text: "Login",
                  loading: ref.watch(authController).loading,
                  onPressed: () => ref.read(authController).login(LoginModel(
                      email: _emailController.text,
                      password: _passwordController.text)),
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
