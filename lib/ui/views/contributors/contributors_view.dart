import 'package:cgpa_calculator/core/extensions/context.extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContributorsView extends StatelessWidget {
  const ContributorsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> students = [
      {'matric': '19/25PC114', 'name': 'Dosumu Oluwabunmi'},
      {'matric': '19/25PC115', 'name': 'Dotche Oluwatobiloba'},
      {'matric': '19/25PC116', 'name': 'Dunmoye Halimah'},
      {'matric': '19/25PC117', 'name': 'Echianu Chinemerem'},
      {'matric': '19/25PC119', 'name': 'Egbokhan Favour'},
      {'matric': '19/25PC120', 'name': 'Ekeneututu Gloria'},
      {'matric': '19/25PC122', 'name': 'Enifeni Taofeek'},
      {'matric': '19/25PC123', 'name': 'Eronmomen Pricilia'},
      {'matric': '19/25PC124', 'name': 'Eseha Joseph'},
      {'matric': '19/25PC125', 'name': 'Ewenike Peace'},
      {'matric': '19/25PC126', 'name': 'Faniran Oluwatobilola'},
      {'matric': '19/25PC127', 'name': 'Fashola Azeezat'},
      {'matric': '19/25PC128', 'name': 'Fatoyinbo Oyinkansola'},
      {'matric': '19/25PC129', 'name': 'Feyisetan Ikeoluwa'},
      {'matric': '19/25PC130', 'name': 'Flourish Faithfulness'},
      {'matric': '19/25PC131', 'name': 'Gabriel Enoch'},
      {'matric': '19/25PC132', 'name': 'Ganiyu Alimat'},
      {'matric': '19/25PC133', 'name': 'Ganiyu Mohi'},
      {'matric': '19/25PC134', 'name': 'Gbadebo Simeon'},
      {'matric': '19/25PC135', 'name': 'Gbodofu Sahadat'},
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Project Contributors",
              style: context.priBold22,
            ),
            const Gap(10),
            Text(
              "Group 7 Project",
              style: context.bold16,
            ),
            const Gap(30),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Person(
                  name: students[index]['name']!,
                  matric: students[index]['matric']!,
                  index: index + 1,
                ),
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: students.length,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Person extends StatelessWidget {
  final String name;
  final String matric;
  final int index;

  const Person(
      {super.key,
      required this.name,
      required this.index,
      required this.matric});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$index .",
          style: context.normal14,
        ),
        const Gap(10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: context.primaryColor.shade100.withOpacity(.7),
                borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.medium16,
                ),
                Text(
                  matric,
                  style: context.normal14.copyWith(
                      color: context.normal14.color!.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
