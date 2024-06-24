import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class DBService {
  void saveActions(List<Map<String, dynamic>> data) {
    final json = jsonEncode(data);
    save("_db-actions", json);
  }

  List<Map<String, dynamic>> getData() {
    final rawData = get("_db-actions");
    if (rawData == null) {
      return [
        {"course": "", "credit": null, "grade": null}
      ];
    } else {
      final data = jsonDecode(rawData);
      List<Map<String, dynamic>> result = [];
      for (var single in data) {
        result.add(single as Map<String, dynamic>);
      }
      return result;
    }
  }

  static const String box = "_db-cgpa";

  Future<void> startHive() async {
    await Hive.initFlutter();
    await Hive.openBox(box);
  }

  Box getBox() {
    return Hive.box(box);
  }

  Future<void> save(String key, dynamic value) async {
    final box = getBox();
    await box.put(key, value);
  }

  Future<void> saveToken(String value) async {
    final box = getBox();
    await box.put("_db-token", value);
  }

  dynamic get(String key) {
    final box = getBox();
    var value = box.get(key);
    return value;
  }

  String? getToken() {
    final box = getBox();
    var value = box.get("_db-token");
    return value;
  }

  Future<void> remove(String key) async {
    final box = getBox();
    await box.delete(key);
  }

  Future<void> clear() async {
    final box = getBox();
    await box.clear();
  }
}
