import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/ui/views/home/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userProvider = StateProvider<UserModel?>((_) => null);
final homeController = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController(ref);
});

class HomeController extends ChangeNotifier {
  final Ref ref;
  final _api = locator<SupabaseClient>();

  HomeController(this.ref);

  Future<void> loadUser() async {
    final res = await _api.from("Profiles").select();
    if (res.isNotEmpty) {
      final data = UserModel.fromJson(res.first);
      ref.read(userProvider.notifier).update((state) => data);
    }
  }
}
