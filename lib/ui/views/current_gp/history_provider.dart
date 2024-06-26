import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final historyController = StateNotifierProvider<HistoryProvider,
    AsyncValue<List<Map<String, dynamic>>>>((ref) {
  return HistoryProvider();
});

class HistoryProvider
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  HistoryProvider() : super(const AsyncData([]));
  final _db = locator<DBService>();
  final _api = locator<SupabaseClient>();

  void addHistory(String cgpa) async {
    state = AsyncData(
      List.from(state.value!)
        ..add({
          "cgpa": cgpa,
          "time": DateTime.now().toIso8601String(),
          "inDb": false
        })
        ..sort((a, b) => b['time'].compareTo(a['time'])),
    );
    _db.saveHistory(state.value!);
    await _api.from("History").insert({"cgpa": cgpa}).whenComplete(() {
      final List<Map<String, dynamic>> updatedData = List.from(state.value!);
      updatedData.last['inDb'] = true;
      _db.saveHistory(updatedData);
    });

    await _api
        .from("Profiles")
        .update({'credit': _db.get('credit')}).eq('user_id', _db.get('id'));
  }

  void init() async {
    final data = _db.getHistory();
    data.sort((a, b) => b['time'].compareTo(a['time']));
    state = AsyncData(data);
    _sync(data);
  }

  void _sync(List<Map<String, dynamic>> data) async {
    List<Map<String, dynamic>> newData = [];
    for (var single in data) {
      if (!single['inDb']) {
        newData.add({
          "cgpa": single['cgpa'],
          "created_at": single['time'],
        });
      }
    }
    await _api.from("History").insert(newData);
    final res = await _api.from("History").select();
    if (res.isNotEmpty) {
      List<Map<String, dynamic>> newHistory = [];
      for (var data in res) {
        newHistory.add({
          "cgpa": data['cgpa'],
          "time": DateTime.parse(data['created_at']),
          "inDb": true
        });
      }
      newHistory.sort((a, b) => b['time'].compareTo(a['time']));
      state = AsyncData(newHistory);
      _db.saveHistory(newHistory);
    }
  }
}
