import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/views/auth/auth_view.dart';
import 'package:cgpa_calculator/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: context.primaryColor,
                ),
              ),
              const Gap(10),
              Text(
                "Profile",
                style: context.priBold22,
              ),
              const Gap(50),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: context.primaryColor.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ref.read(userProvider)?.fullName ?? "--",
                      style: context.bold22,
                    ),
                    const Gap(10),
                    Text(
                      "Current CGPA ",
                      style: context.normal16,
                    ),
                    Text(
                      (ref.read(userProvider)?.cgpa ?? 0.00).toString(),
                      style: context.priBold35,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                ref.read(userProvider)?.email ?? "--",
                style: context.medium16,
              ),
              const Spacer(),
              AppButton(
                text: "Logout",
                onPressed: () {
                  locator<SupabaseClient>().auth.signOut();
                  context.go(const AuthView());
                },
                color: Colors.red,
                textColor: AppColors.white,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
