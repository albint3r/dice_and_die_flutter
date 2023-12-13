import 'schemas/auth_response.dart';

abstract interface class IAuthFacade {
  Future<AuthResponse> loginFromSessionToken(
    String sessionToken,
  );

  Future<AuthResponse> logIn(
    String email,
    String password,
  );

  Future<AuthResponse> signIn(
    String email,
    String password,
  );

  Future<void> logOut();
}
