import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ButtonType { outlined, filled }

enum ButtonWidth { full, wrap }

class AppButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final ButtonWidth width;
  final Widget? icon;
  final bool? disabled;
  final bool? loading;
  final Color? color;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.width = ButtonWidth.full,
    this.icon,
    this.color,
    this.textColor,
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: disabled! ? null : loading! ? null: onPressed,
      elevation: 0,
      disabledElevation: 0,
      disabledColor:
          color?.withOpacity(0.4) ?? context.primaryColor.withOpacity(0.4),
      highlightElevation: 0,
      shape: type == ButtonType.outlined
          ? RoundedRectangleBorder(
              side: BorderSide(color: color ?? AppColors.white),
              borderRadius: BorderRadius.circular(5),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
      color: type == ButtonType.filled
          ? loading!
              ? AppColors.primary.withOpacity(0.3)
              : color ?? AppColors.primary
          : null,
      minWidth: width == ButtonWidth.full ? double.infinity : 5,
      height: 50,
      child: loading!
          ? Center(
              child: SizedBox(
                width: 17,
                height: 17,
                child: CircularProgressIndicator(
                  color: textColor ?? color ?? Colors.white.withOpacity(.9),
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) icon!,
                Text(
                  text,
                  style: AppTextStyles.normal(16).copyWith(
                      color:
                          textColor ?? color ?? Colors.white.withOpacity(.9)),
                )
              ],
            ),
    );
  }
}
