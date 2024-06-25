import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppDialogs {
  final GlobalKey<NavigatorState> _navigatorKey;
  AppDialogs(this._navigatorKey) {
    _context = _navigatorKey.currentContext!;
  }

  late BuildContext _context;
  void showErrorSheet(String error) {
    showModalBottomSheet(
      context: _context,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              Text(
                "Error",
                style: context.bold18.copyWith(color: Colors.red),
              ),
              const Gap(20),
              Text(
                error,
                style: context.bold16,
              ),
              const Gap(20),
              AppButton(
                text: "Cancel",
                onPressed: () => _context.pop(),
                type: ButtonType.outlined,
                color: _context.primaryColor,
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
