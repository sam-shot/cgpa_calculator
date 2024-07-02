// ignore_for_file: must_be_immutable

import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/views/advise_view/controller/advice_controller.dart';
import 'package:cgpa_calculator/ui/views/contributors/contributors_view.dart';
import 'package:cgpa_calculator/ui/views/current_gp/history_provider.dart';
import 'package:cgpa_calculator/ui/views/home/home_view.dart';
import 'package:cgpa_calculator/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class BottomNavWidget extends ConsumerStatefulWidget {
  int index;

  BottomNavWidget({super.key, required this.index});

  @override
  ConsumerState<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends ConsumerState<BottomNavWidget> {
  int currentIndex = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    _screens = [
      const ContributorsView(),
      const HomeView(),
      const SettingsView(),
    ];
    Future(() => ref.read(historyController.notifier).init());
    Future(() => ref.read(adviseController.notifier).init());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 1) {
          goToScreen(1);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: context.primaryColor.shade100.withOpacity(.5),
              selectedItemColor: context.primaryColor,
              unselectedItemColor: AppColors.black,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                goToScreen(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const NavBarItem(
                    iconPath: Icons.info_outline_rounded,
                    label: "Info",
                  ),
                  activeIcon: NavBarItem(
                    iconPath: Icons.info_rounded,
                    label: "Info",
                    isActive: true,
                    color: context.primaryColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: const NavBarItem(
                    iconPath: Icons.home_rounded,
                    label: "Home",
                  ),
                  activeIcon: NavBarItem(
                    iconPath: Icons.home_rounded,
                    label: "Home",
                    isActive: true,
                    color: context.primaryColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: const NavBarItem(
                    iconPath: Icons.settings_outlined,
                    label: "Settings",
                  ),
                  activeIcon: NavBarItem(
                    iconPath: Icons.settings,
                    label: "Settings",
                    isActive: true,
                    color: context.primaryColor,
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToScreen(int value) {
    currentIndex = value;
    setState(() {});
  }
}

class NavBarItem extends ConsumerWidget {
  final IconData iconPath;
  final String label;
  final Color? color;
  final bool isActive;

  const NavBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.color,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconPath,
          // ignore: deprecated_member_use
          color: color ??
              (isActive
                  ? AppColors.black
                  : Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .color!
                      .withOpacity(0.3)),
          size: 20,
        ),
        const Gap(3),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color ??
                (isActive
                    ? AppColors.black
                    : Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .color!
                        .withOpacity(0.3)),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
