import 'package:flutter_riverpod/flutter_riverpod.dart';

final gpController =
    StateNotifierProvider<GpProvider, AsyncValue<List<Map<String, dynamic>>>>(
        (ref) {
  return GpProvider();
});

class GpProvider extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  GpProvider()
      : super(const AsyncData([
          {"course": null, "credit": null, "grade": null}
        ]));

  void addCourse() {
    state = AsyncData(List.from(state.value!)
      ..add({"course": null, "credit": null, "grade": null}));
  }

  void removeCourse(int index) {
    List<Map<String, dynamic>> test = state.value!;
    test.removeAt(index);
    print(test);
    state = AsyncData(test);
  }

  void reset() {
    state = const AsyncData([
      {"course": null, "credit": null, "grade": null}
    ]);
  }

  void updateCourse(index, data) {
    state.value![index]['course'] = data.toString().toUpperCase();
    print(state);
  }

  void updateCredit(index, int data) {
    state.value![index]['credit'] = data;
    print(state);
  }

  void updateGrade(index, data) {
    state.value![index]['grade'] = data.toString();
    print(state);
  }
}
