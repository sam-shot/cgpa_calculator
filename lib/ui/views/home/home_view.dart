import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/views/calculate_gp/calculate_gp_view.dart';
import 'package:cgpa_calculator/ui/views/calculate_gp/gp_provider.dart';
import 'package:cgpa_calculator/ui/views/current_gp/current_gp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                style: context.priBold22,
              ),
              const Gap(50),
              Text(
                "Quick Actions",
                style: context.bold16,
              ),
              const Gap(20),
              Row(
                children: [
                  HomeTile(
                    activeIcon: Icons.calculate,
                    backgroundIcon: Icons.calculate_outlined,
                    label: "Calculate GP",
                    onTap: () {
                      ref.read(gpController.notifier).reset();
                      context.push(const CalculateGPView());
                    },
                  ),
                  const Gap(10),
                  HomeTile(
                    activeIcon: Icons.bar_chart,
                    backgroundIcon: Icons.bar_chart_outlined,
                    label: "View Current GP",
                    onTap: () {
                      context.push(const CurrentGpView());
                    },
                  ),
                ],
              ),
              const Gap(10),
              const Row(
                children: [
                  HomeTile(
                    activeIcon: Icons.calculate,
                    backgroundIcon: Icons.calculate_outlined,
                    label: "Calculate GP",
                  ),
                  Gap(10),
                  HomeTile(
                    activeIcon: Icons.calculate,
                    backgroundIcon: Icons.calculate_outlined,
                    label: "Calculate GP",
                  ),
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
  final String label;
  final IconData activeIcon;
  final IconData backgroundIcon;
  final VoidCallback? onTap;

  const HomeTile(
      {super.key,
      required this.label,
      required this.activeIcon,
      this.onTap,
      required this.backgroundIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(builder: (context, ref, _) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: context.primaryColor.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: const Offset(40, -30),
                    child: Icon(
                      backgroundIcon,
                      size: 150,
                      color: AppColors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          activeIcon,
                          color: context.primaryColor,
                          size: 40,
                        ),
                        const Gap(10),
                        Text(
                          label,
                          style: context.bold16.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
