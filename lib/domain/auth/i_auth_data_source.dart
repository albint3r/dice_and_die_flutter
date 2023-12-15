import 'schemas/auth_response.dart';

abstract interface class IAuthDataSource {
  Future<AuthResponse> signIn(
    String email,
    String password,
  );

  Future<AuthResponse> logIn(
    String email,
    String password,
  );

  Future<AuthResponse> logInFromSessionToken(
    String sessionToken,
  );
}
