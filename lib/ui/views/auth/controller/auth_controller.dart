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
import 'package:google_sign_in/google_sign_in.dart';
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

  void googleLogin() async {
    loading = true;
    notifyListeners();
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId:
            "407002125531-t338d6117p8gtgs8se62vb6ck52a8t28.apps.googleusercontent.com",
        scopes: [
          'profile',
          'openid',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      final res = await _api.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken ?? "",
        accessToken: accessToken,
      );

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
    } catch (e) {
      _dialog
          .showErrorSheet("Google Sign in failed!\n\n Please try again later.");
    }
    loading = false;
    notifyListeners();
  }

  void signUp(SignupModel data) async {
    loading = true;
    notifyListeners();
    try {
      final res = await _api.auth.signUp(
        email: data.email,
        password: data.password,
        data: {"full_name": data.fullName},
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
