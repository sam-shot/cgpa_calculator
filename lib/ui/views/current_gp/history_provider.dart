import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyController = StateNotifierProvider<HistoryProvider,
    AsyncValue<List<Map<String, dynamic>>>>((ref) {
  return HistoryProvider();
});

class HistoryProvider
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  HistoryProvider() : super(const AsyncData([]));
  final _db = locator<DBService>();
  void addHistory(String cgpa) {
    state = AsyncData(List.from(state.value!)
      ..add({
        "cgpa": cgpa,
        "time": DateTime.now().toIso8601String(),
      }));

    _db.saveHistory(state.value!);
  }

  void init() {
    final data = _db.getHistory();
    state = AsyncData(data);
  }
}
