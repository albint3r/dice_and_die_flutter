import 'schemas/auth_response.dart';

abstract interface class IAuthDataSource {
  Future<AuthResponse> signIn(
    String email,
    String name,
    String password,
    String referralCode,
  );

  Future<AuthResponse> logIn(
    String email,
    String password,
  );

  Future<AuthResponse> logInWithGoogle(
    String googleUserId,
  );

  Future<AuthResponse> logInFromSessionToken(
    String sessionToken,
  );
}
