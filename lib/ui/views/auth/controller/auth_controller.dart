import 'package:cgpa_calculator/core/app/locator.dart';
import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:cgpa_calculator/ui/utils/app_navigation.dart';
import 'package:cgpa_calculator/ui/utils/dialogs.dart';
import 'package:cgpa_calculator/ui/views/auth/model/login_model.dart';
import 'package:cgpa_calculator/ui/views/auth/model/signup_model.dart';
import 'package:cgpa_calculator/ui/views/bottom_nav/bottom_nav.dart';
import 'package:cgpa_calculator/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authController = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController(ref);
});

class AuthController extends ChangeNotifier {
  final Ref ref;
  AuthController(this.ref);
  final _db = locator<DBService>();
  final _api = locator<SupabaseClient>();
  final _dialog = locator<AppDialogs>();
  final _nav = locator<AppNavigator>();

  bool loading = false;

  void login(LoginModel data) async {
    loading = true;
    notifyListeners();
    try {
      final res = await _api.auth
          .signInWithPassword(email: data.email, password: data.password);
      if (res.session != null) {
        await ref.read(homeController).loadUser();
        _nav.go(
          BottomNavWidget(
            index: 1,
          ),
        );
      } else {
        _dialog.showErrorSheet("An Error occurred");
      }
    } on AuthException catch (e) {
      _dialog.showErrorSheet(e.message);
    }
    loading = false;
    notifyListeners();
    return null;
  }

  void signUp(SignupModel data) async {
    loading = true;
    notifyListeners();
    try {
      final res = await _api.auth.signUp(
        email: data.email,
        password: data.password,
        data: {"fullname": data.fullName},
      );
      if (res.session != null) {
        await _api.auth
            .signInWithPassword(email: data.email, password: data.password);
        await ref.read(homeController).loadUser();
        _nav.go(
          BottomNavWidget(
            index: 1,
          ),
        );
      } else {
        _dialog.showErrorSheet("An Error occurred");
      }
    } on AuthException catch (e) {
      _dialog.showErrorSheet(e.message);
    }
    loading = false;
    notifyListeners();
  }
}
