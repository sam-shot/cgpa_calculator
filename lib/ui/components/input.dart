// ignore_for_file: must_be_immutable

import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TextFieldSize { small }

class AppTextField extends ConsumerStatefulWidget {
  final String? hint;
  final String? errorText;
  final String? helperText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final TextCapitalization? capitalization;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final double? radius;
  final int? minLines;
  final TextInputFormatter? inputType;
  bool isDisabled = false;
  final bool? opaqueBackground;
  AppTextField({
    required this.controller,
    this.hint,
    this.helperText,
    this.errorText,
    this.isPassword = false,
    this.isDisabled = false,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.capitalization,
    this.maxLines,
    this.minLines,
    this.radius,
    this.inputType,
    this.opaqueBackground,
    super.key,
    this.onTap,
    this.focusNode,
  });

  @override
  ConsumerState<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    bool checkIfPassword = widget.isPassword;
    return TextField(
      enabled: !widget.isDisabled,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      textCapitalization: widget.capitalization ?? (TextCapitalization.none),
      maxLines: checkIfPassword ? 1 : widget.maxLines ?? 1,
      style: widget.isDisabled
          ? AppTextStyles.medium(16)
              .copyWith(color: AppColors.black.withOpacity(0.3))
          : AppTextStyles.medium(16).copyWith(color: AppColors.black),
      obscureText: checkIfPassword ? isObscure : false,
      controller: widget.controller,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputType != null ? [widget.inputType!] : [],
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black.withOpacity(.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              widget.radius ?? 10,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          errorText: widget.errorText,
          helperText: widget.helperText,
          helperStyle: AppTextStyles.normal(12)
              .copyWith(color: AppColors.black.withOpacity(0.7)),
          errorStyle: AppTextStyles.normal(12).copyWith(color: Colors.red),
          prefixIcon: widget.prefix != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [widget.prefix!],
                )
              : null,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                )
              : widget.suffix != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.suffix!],
                    )
                  : null),
    );
  }
}

String? validateEmailTextFields(String value) {
  if (RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{1,7}$')
      .hasMatch(value)) {
    return null;
  } else if (value == "") {
    return "Email Field must not be empty";
  } else {
    return "Email is Invalid";
  }
}

String? validatePasswordTextFields(String value) {
  if (value.isEmpty) return "Password must not be empty";
  if (value.length < 6) return "Password must be at least 6 characters long";
  return null;
}

String? validatePhoneNumberTextFields(String value) {
  if (value.isEmpty) return "Phone number must not be empty";
  if (value.length < 11 || value.length > 11) {
    return "Phone number must be 11 characters long";
  }
  return null;
}

String? validateNameTextFields(String value) {
  if (value.isEmpty) return "Name can't be empty";
  return null;
}

String? validatePollTextFields(String value) {
  if (value.isEmpty) return "Poll can't be empty";
  return null;
}

String? validateEditNameTextFields(String value) {
  if (value.isEmpty) return "Name can't be empty";
  if (value.split(" ").length < 2) return "You are to input your Fullname";
  if (value.split(" ")[1].isEmpty) return "You are to input your Fullname";
  return null;
}

String? validateCardNoTextFields(String value) {
  if (value.isEmpty) return "Card number can't be empty";
  if (value.length < 16) {
    return "Card number must be 16 characters long";
  }
  return null;
}

String? validateCvvTextFields(String value) {
  if (value.isEmpty) return "CVV can't be empty";
  if (value.length < 3) {
    return "CVV must be 3 characters long";
  }
  return null;
}

String? validateCardNameTextFields(String value) {
  if (value.isEmpty) return "Card name can't be empty";
  return null;
}
