import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
            color: context.primaryColor.shade100.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: context.primaryColor,
                ),
                const Gap(10),
                Text(
                  label,
                  style: context.priNormal16.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: context.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class DarktSettingTile extends ConsumerStatefulWidget {
  const DarktSettingTile({super.key});

  @override
  ConsumerState<DarktSettingTile> createState() => _DarktSettingTileState();
}

class _DarktSettingTileState extends ConsumerState<DarktSettingTile> {
  bool isDark = false;
  @override
  void initState() {
    isDark = ref.read(themeProvider).isDark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
            color: context.primaryColor.shade100.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.dark_mode_outlined,
                  size: 25,
                  color: context.primaryColor,
                ),
                const Gap(10),
                Text(
                  "Dark Mode",
                  style: context.priNormal16.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = !isDark;
                });
                ref.read(themeProvider.notifier).switchTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
