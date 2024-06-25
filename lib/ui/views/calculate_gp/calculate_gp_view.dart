import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/extensions/string.extensions.dart';
import 'package:cgpa_calculator/ui/components/button.dart';
import 'package:cgpa_calculator/ui/components/input.dart';
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
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: context.primaryColor,
                ),
              ),
              const Gap(10),
              Text(
                "Calculate GP",
                style: AppTextStyles.bold(22).copyWith(
                  color: context.primaryColor,
                ),
              ),
              Text(
                "Note: A=5, B=4, C=3, D=2, E=1, F=0",
                style: context.normal14,
              ),
              const Gap(40),
              ref.watch(gpController).when(
                    data: (data) => Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...data.map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 13),
                                  child: GradeRow(
                                    data: e,
                                    index: data.indexOf(e),
                                    first: data.indexOf(e) == 0,
                                    cancellable: data.length > 1,
                                  ),
                                )),
                            const Gap(20),
                            AppButton(
                              text: "Add Course",
                              type: ButtonType.outlined,
                              color: context.primaryColor,
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
                onPressed: () {
                  final data = ref.read(gpController.notifier).calculateGP();
                  if (data.$1) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(15),
                              Text(
                                "Success",
                                style: context.bold18,
                              ),
                              const Gap(20),
                              ClipOval(
                                child: Image.asset(
                                  "confetti".png,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const Gap(20),
                              Text(
                                "Your CGPA is:",
                                style: context.bold16,
                              ),
                              const Gap(5),
                              Text(
                                data.$2.toString(),
                                style: AppTextStyles.boldB(26)
                                    .copyWith(color: context.primaryColor),
                              ),
                              const Gap(20),
                              AppButton(
                                text: "Close",
                                onPressed: () => context.pop(),
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    showModalBottomSheet(
                      context: context,
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
                                style: AppTextStyles.boldB(18)
                                    .copyWith(color: Colors.red),
                              ),
                              const Gap(20),
                              Text(
                                "Please fill in the empty fields",
                                style: AppTextStyles.boldB(16),
                              ),
                              const Gap(20),
                              AppButton(
                                text: "Cancel",
                                onPressed: () => context.pop(),
                                type: ButtonType.outlined,
                                color: context.primaryColor,
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
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
  final bool first;
  final bool cancellable;

  const GradeRow({
    super.key,
    required this.data,
    required this.index,
    required this.first,
    required this.cancellable,
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
    credit = widget.data['credit'];
    grade = widget.data['grade'];
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
              if (widget.first) ...[
                Text(
                  "Course",
                  style: context.normal14,
                ),
                const Gap(5),
              ],
              AppTextField(
                controller: course,
                bgColor: Colors.transparent,
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
              if (widget.first) ...[
                Text(
                  "Credit",
                  style: context.normal14,
                ),
                const Gap(5),
              ],
              DropdownButtonFormField(
                value: credit,
                items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text("$e unit", style: context.normal16),
                        ))
                    .toList(),
                padding: EdgeInsets.zero,
                icon: const SizedBox(),
                hint: Text(
                  "3 Unit",
                  style: context.normal16.copyWith(
                      color: context.normal16.color!.withOpacity(0.5)),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.normal16.color!.withOpacity(.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.primaryColor,
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
              if (widget.first) ...[
                Text(
                  "Grade",
                  style: context.normal14,
                ),
                const Gap(5),
              ],
              DropdownButtonFormField(
                value: grade,
                items: ['A', 'B', 'C', 'D', 'E', 'F']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: context.normal16),
                        ))
                    .toList(),
                padding: EdgeInsets.zero,
                icon: const SizedBox(),
                hint: Text(
                  "E.g A",
                  style: context.normal16.copyWith(
                      color: context.normal16.color!.withOpacity(0.5)),
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.normal16.color!.withOpacity(.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.primaryColor,
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
        if (widget.cancellable)
          Center(
            child: IconButton(
              onPressed: () =>
                  ref.read(gpController.notifier).removeCourse(widget.index),
              icon: const Icon(
                Icons.close,
              ),
            ),
          ),
      ],
    );
  }
}
