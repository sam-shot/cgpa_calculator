import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:cgpa_calculator/core/extensions/datetime.extensions.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:cgpa_calculator/ui/views/current_gp/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: context.primaryColor,
                ),
              ),
              const Gap(10),
              Text(
                "My GP",
                style: context.priBold22,
              ),
              const Gap(30),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: context.primaryColor.shade100,
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
                            style: context.bold16,
                          ),
                          const Gap(10),
                          Text(
                            locator<DBService>().get("cgpa") ?? "--",
                            style: context.priBold35,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: context.primaryColor,
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
                            style: context.bold16,
                          ),
                          const Gap(10),
                          Text(
                            locator<DBService>().get("credit") ?? "--",
                            style: context.normal16.copyWith(fontSize: 35.sp),
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
                style: context.bold16.copyWith(fontSize: 15.sp),
              ),
              const Gap(4),
              Divider(
                thickness: 0,
                height: 1,
                color: context.primaryColor,
              ),
              const Gap(15),
              Expanded(
                child: ref.watch(historyController).when(
                      data: (data) => ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => HistoryItem(
                          cgpa: data[index]['cgpa'].toString(),
                          time:
                              "${DateTime.parse(data[index]['time']).getTimeOnly} ${DateTime.parse(data[index]['time']).getFullDate}",
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
          color: context.primaryColor.shade100,
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cgpa,
            style: context.bold35,
          ),
          Text(
            time,
            style: context.medium16.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
