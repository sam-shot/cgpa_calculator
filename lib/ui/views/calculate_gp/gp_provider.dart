import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gpController =
    StateNotifierProvider<GpProvider, AsyncValue<List<Map<String, dynamic>>>>(
        (ref) {
  return GpProvider();
});

class GpProvider extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  GpProvider() : super(const AsyncData([]));
  final _db = locator<DBService>();
  void addCourse() {
    state = AsyncData(List.from(state.value!)
      ..add({"course": "", "credit": null, "grade": null}));
    _db.saveActions(state.value!);
  }

  void removeCourse(int index) async {
    List<Map<String, dynamic>> test = state.value!;
    test.removeAt(index);
    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 10));
    state = AsyncData(test);
    _db.saveActions(state.value!);
  }

  void reset() {
    final data = _db.getData();
    state = AsyncData(data);
  }

  void updateCourse(index, data) {
    final currentState = state.value;
    final updatedList = currentState!
        .map((item) => currentState.indexOf(item) == index
            ? {...item, 'course': data.toUpperCase()}
            : item)
        .toList();
    state = AsyncData(updatedList);
    _db.saveActions(state.value!);
  }

  void updateCredit(index, int data) {
    state.value![index]['credit'] = data;
    _db.saveActions(state.value!);
  }

  void updateGrade(index, data) {
    state.value![index]['grade'] = data.toString();
    _db.saveActions(state.value!);
  }

  (bool, String?) calculateGP() {
    final hasNull = state.value!.any(
        (map) => map.values.any((value) => (value == "" || value == null)));
    if (hasNull) {
      return (false, null);
    } else {
      num totalCredits = 0.0;
      num gradePoints = 0.0;

      for (var course in state.value!) {
        final credit = course['credit'] as int;
        final grade = course['grade'] as String;

        totalCredits += credit.toDouble();
        gradePoints += (grade == 'A'
                ? 5
                : grade == 'B'
                    ? 4
                    : grade == 'C'
                        ? 3
                        : grade == 'D'
                            ? 2
                            : grade == 'E'
                                ? 1
                                : 0) *
            credit;
      }
      _db.save("cgpa", (gradePoints / totalCredits).toStringAsFixed(2));
      _db.save("credit", totalCredits.toInt().toString());
      return (true, (gradePoints / totalCredits).toStringAsFixed(2));
    }
  }
}
