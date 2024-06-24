import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:cgpa_calculator/ui/styles/colors.dart';
import 'package:cgpa_calculator/ui/styles/typography.dart';
import 'package:cgpa_calculator/ui/views/current_gp/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CurrentGpView extends ConsumerWidget {
  const CurrentGpView({super.key});

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
                "My GP",
                style: AppTextStyles.bold(22).copyWith(
                  color: AppColors.primary,
                ),
              ),
              const Gap(30),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current CGPA ",
                            style: AppTextStyles.boldB(16),
                          ),
                          const Gap(10),
                          Text(
                            locator<DBService>().get("cgpa") ?? "--",
                            style: AppTextStyles.boldB(35)
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.primaryThick,
                      height: 25,
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Total credits",
                            style: AppTextStyles.boldB(16),
                          ),
                          const Gap(10),
                          Text(
                            locator<DBService>().get("credit") ?? "--",
                            style: AppTextStyles.normalB(35)
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                "GP History",
                style: AppTextStyles.boldB(15),
              ),
              const Gap(4),
              const Divider(
                thickness: 0,
                height: 1,
                color: AppColors.primary,
              ),
              const Gap(15),
              Expanded(
                child: ref.watch(historyController).when(
                      data: (data) => ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => HistoryItem(
                          cgpa: data.reversed.toList()[index]['cgpa'],
                          time: DateTime.parse(data[index]['time']).toString(),
                        ),
                      ),
                      error: (error, stackTrace) => const Text("data"),
                      loading: () => const Text("data"),
                    ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String cgpa;
  final String time;

  const HistoryItem({super.key, required this.cgpa, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cgpa,
            style: AppTextStyles.boldB(35).copyWith(color: AppColors.primary),
          ),
          Text(
            time,
            style: AppTextStyles.boldB(15),
          ),
        ],
      ),
    );
  }
}
