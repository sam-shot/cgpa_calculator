import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Advice",
                style: context.priBold22,
              ),
          ],
        ),
      )),
    );
  }
}
