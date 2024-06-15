import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/components/button.dart';
import 'package:cgpa_calculator/ui/views/components/input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fnController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                IconButton(
                  onPressed: ()=> context.pop(),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.white,
                  ),
                ),
                const Gap(70),
                Align(
                  child: Text(
                    "SIGNUP",
                    style: AppTextStyles.bold(22),
                  ),
                ),
                const Gap(70),
                Text(
                  "Full Name",
                  style: AppTextStyles.normal(18),
                ),
                const Gap(5),
                AppTextField(
                  controller: _fnController,
                  hint: "John Doe",
                ),
                const Gap(20),
                Text(
                  "Email",
                  style: AppTextStyles.normal(18),
                ),
                const Gap(5),
                AppTextField(
                  controller: _emailController,
                  hint: "johndoe@gmail.com",
                ),
                const Gap(20),
                Text(
                  "Password",
                  style: AppTextStyles.normal(18),
                ),
                const Gap(5),
                AppTextField(
                  controller: _passwordController,
                  hint: "********",
                  isPassword: true,
                ),
                const Gap(120),
                AppButton(
                  text: "Sign up",
                  color: AppColors.white,
                  type: ButtonType.outlined,
                  onPressed: () {},
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
