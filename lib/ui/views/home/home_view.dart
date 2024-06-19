import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/calculate_gp/calculate_gp_view.dart';
import 'package:cgpa_calculator/ui/views/calculate_gp/gp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text(
                "Welcome, Dele",
                style: AppTextStyles.bold(22).copyWith(
                  color: AppColors.primary,
                ),
              ),
              const Gap(100),
              const Row(
                children: [
                  HomeTile(),
                  Gap(10),
                  HomeTile(),
                ],
              ),
              const Gap(10),
              const Row(
                children: [
                  HomeTile(),
                  Gap(10),
                  HomeTile(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref,_) {
          return GestureDetector(
            onTap: () {
              ref.read(gpController.notifier).reset();
              context.push(const CalculateGPView());
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.calculate_outlined,
                    color: AppColors.white,
                    size: 40,
                  ),
                  const Gap(10),
                  Text(
                    "Calculate GP",
                    style: AppTextStyles.bold(14),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
