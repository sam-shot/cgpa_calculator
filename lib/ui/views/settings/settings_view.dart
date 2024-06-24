import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/settings/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text(
                "Settings",
                style: AppTextStyles.bold(22).copyWith(
                  color: AppColors.primary,
                ),
              ),
              const Gap(50),
              SettingTile(
                icon: Icons.person_outlined,
                label: "Account",
                onTap: () => context.push(const ProfileView()),
              ),
              const Gap(10),
              const SettingTile(
                icon: Icons.dark_mode_outlined,
                label: "Dark Mode",
              ),
              const Gap(10),
              const SettingTile(
                icon: Icons.help_outline_rounded,
                label: "Help and support",
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const SettingTile(
      {super.key, required this.label, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: AppColors.primaryThick,
                ),
                const Gap(10),
                Text(
                  label,
                  style: AppTextStyles.normalB(15).copyWith(
                    color: AppColors.primaryThick,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.primaryThick,
            ),
          ],
        ),
      ),
    );
  }
}
