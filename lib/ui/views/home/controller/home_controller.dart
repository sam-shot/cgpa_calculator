import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
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
  final _db = locator<DBService>();

  HomeController(this.ref);

  Future<void> loadUser() async {
    try {
      final res = await _api
          .from("Profiles")
          .select()
          .timeout(const Duration(seconds: 5));
      if (res.isNotEmpty) {
        final data = UserModel.fromJson(res.first);
        ref.read(userProvider.notifier).update((state) => data);
        _db.save("cgpa", data.cgpa!.toStringAsFixed(2));
        _db.save("credit", data.credits.toString());
        _db.save("id", data.userId.toString());
      }
    } on Exception catch (e) {
      final session = locator<SupabaseClient>().auth.currentSession;
      if (session != null) {
        final data = UserModel(
            cgpa: _db.get("cgpa") == null
                ? 0.00
                : double.parse((_db.get("cgpa"))),
            email: session.user.email!,
            credits: _db.get('credit'),
            fullName: session.user.userMetadata?['fullname'] ?? "--",
            userId: session.user.id);
        ref.read(userProvider.notifier).update((state) => data);
        _db.save("cgpa", data.cgpa!.toStringAsFixed(2));
        _db.save("credit", data.credits.toString());
        _db.save("id", data.userId.toString());
      }
    }
  }
}
