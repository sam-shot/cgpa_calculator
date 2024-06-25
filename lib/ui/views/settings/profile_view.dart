import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
                      "Samuel Ademujimi",
                      style: context.bold22,
                    ),
                    const Gap(10),
                    Text(
                      "Current CGPA ",
                      style: context.normal16,
                    ),
                    Text(
                      locator<DBService>().get("cgpa") ?? "--",
                      style: context.priBold35,
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                "samshotmedia01@gmail.com ",
                style: context.medium16,
              ),
              const Spacer(),
              AppButton(
                text: "Logout",
                onPressed: () {},
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
