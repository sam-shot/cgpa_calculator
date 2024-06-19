import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/components/input.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/calculate_gp/gp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CalculateGPView extends ConsumerWidget {
  const CalculateGPView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.primary,
                ),
              ),
              const Gap(10),
              Text(
                "Calculate GP",
                style: AppTextStyles.bold(22).copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                "Note: A=5, B=4, C=3, D=2, E=1, F=0",
                style: AppTextStyles.normalB(14),
              ),
              const Gap(40),
              ref.watch(gpController).when(
                    data: (data) => Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...data.map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  child:
                                      GradeRow(data: e, index: data.indexOf(e)),
                                )),
                            const Gap(20),
                            AppButton(
                              text: "Add Course",
                              type: ButtonType.outlined,
                              color: AppColors.primary,
                              onPressed: () =>
                                  ref.read(gpController.notifier).addCourse(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    error: (error, stackTrace) => const Text("data"),
                    loading: () => const Text("data"),
                  ),
              const Gap(20),
              AppButton(
                text: "Calculate GP",
                onPressed: () {},
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

class GradeRow extends ConsumerStatefulWidget {
  final Map<String, dynamic> data;
  final int index;

  const GradeRow({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  ConsumerState<GradeRow> createState() => _GradeRowState();
}

class _GradeRowState extends ConsumerState<GradeRow> {
  late TextEditingController course;
  int? credit;
  String? grade;
  @override
  void initState() {
    super.initState();
    course = TextEditingController(text: widget.data['course'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Course",
                style: AppTextStyles.normalB(14),
              ),
              const Gap(5),
              AppTextField(
                controller: course,
                hint: "E.g MAT 113",
                capitalization: TextCapitalization.characters,
                onChanged: (e) {
                  ref.read(gpController.notifier).updateCourse(widget.index, e);
                },
              ),
            ],
          ),
        ),
        const Gap(5),
        Expanded(
          child: Column(
            children: [
              Text(
                "Credit",
                style: AppTextStyles.normalB(14),
              ),
              const Gap(5),
              DropdownButtonFormField(
                value: credit,
                items: [1, 2, 3, 4]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child:
                              Text("$e unit", style: AppTextStyles.normalB(17)),
                        ))
                    .toList(),
                padding: EdgeInsets.zero,
                icon: const SizedBox(),
                hint: Text(
                  "3 Unit",
                  style: AppTextStyles.normalB(17)
                      .copyWith(color: AppColors.black.withOpacity(0.5)),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.black.withOpacity(.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  credit = value;
                  ref
                      .read(gpController.notifier)
                      .updateCredit(widget.index, value!);
                },
              ),
            ],
          ),
        ),
        const Gap(5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Grade",
                style: AppTextStyles.normalB(14),
              ),
              const Gap(5),
              DropdownButtonFormField(
                value: grade,
                items: ['A', 'B', 'C', 'D', 'E', 'F']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: AppTextStyles.normalB(17)),
                        ))
                    .toList(),
                padding: EdgeInsets.zero,
                icon: const SizedBox(),
                hint: Text(
                  "E.g A",
                  style: AppTextStyles.normalB(17)
                      .copyWith(color: AppColors.black.withOpacity(0.5)),
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.black.withOpacity(.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  grade = value;
                  ref
                      .read(gpController.notifier)
                      .updateGrade(widget.index, value);
                },
              ),
            ],
          ),
        ),
        Center(
          child: IconButton(
            onPressed: ()=>ref.read(gpController.notifier).removeCourse(widget.index),
            icon: const Icon(
              Icons.close,
            ),
          ),
        ),
      ],
    );
  }
}
