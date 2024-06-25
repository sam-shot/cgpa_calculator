import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/views/settings/profile_view.dart';
import 'package:cgpa_calculator/ui/views/settings/widgets/settings_tile.dart';
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
                style: context.priBold22,
              ),
              const Gap(50),
              SettingTile(
                icon: Icons.person_outlined,
                label: "Account",
                onTap: () => context.push(const ProfileView()),
              ),
              const Gap(10),
              const DarktSettingTile(),
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
