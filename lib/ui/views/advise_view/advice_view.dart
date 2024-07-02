import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/views/advise_view/controller/advice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              "Advise of the day",
              style: context.priBold22,
            ),
            const Gap(30),
            Consumer(
              builder: (_, ref, __) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.primaryColor.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(5),
                      Text(
                        ref.read(adviseController)['text'] ?? "--",
                        style: context.bold18,
                      ),
                      const Gap(20),
                      Text(
                        "- ${ref.read(adviseController)['author'] ?? "-"}",
                        style: context.priBold16.copyWith(
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
