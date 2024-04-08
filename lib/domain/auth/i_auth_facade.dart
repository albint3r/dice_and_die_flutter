import 'package:shared_preferences/shared_preferences.dart';

import '../../infrastructure/core/user_preference.dart';
import 'schemas/auth_response.dart';

abstract interface class IAuthFacade {
  UserPreference get pref;

  Future<AuthResponse> loginFromSessionToken(
    String sessionToken,
  );

  Future<AuthResponse> logIn(
    String email,
    String password,
  );

  Future<AuthResponse> signIn(
    String email,
    String name,
    String password,
  );

  Future<void> logOut();

  Future<void> saveSessionTokenInPref(
    String sessionToken,
  );

  Future<void> deleteSessionTokenInPref();
}
