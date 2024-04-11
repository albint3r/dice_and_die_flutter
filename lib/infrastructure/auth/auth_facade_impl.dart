import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_data_source.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/schemas/auth_response.dart';
import '../core/user_preference.dart';

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  AuthFacadeImpl(
    this._dataSource,
    this._userPreference,
    this._firebaseAuth,
  );

  final IAuthDataSource _dataSource;
  final UserPreference _userPreference;
  final FirebaseAuth _firebaseAuth;

  @override
  UserPreference get pref => _userPreference;

  @override
  Future<AuthResponse> logIn(String email, String password) =>
      _dataSource.logIn(
        email,
        password,
      );

  @override
  Future<void> logOut() => _userPreference.deleteSessionToken();

  @override
  Future<AuthResponse> loginFromSessionToken(String sessionToken) =>
      _dataSource.logInFromSessionToken(
        sessionToken,
      );

  @override
  Future<AuthResponse> signIn(
    String email,
    String name,
    String password,
  ) =>
      _dataSource.signIn(
        email,
        name,
        password,
      );

  @override
  Future<void> saveSessionTokenInPref(String sessionToken) =>
      _userPreference.setSessionToken(
        sessionToken,
      );

  @override
  Future<void> deleteSessionTokenInPref() =>
      _userPreference.deleteSessionToken();
}
