import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/auth/i_auth_data_source.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/schemas/auth_response.dart';
import '../core/user_preference.dart';

@Injectable(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  AuthFacadeImpl(
    this._dataSource,
    this._userPreference,
  );

  final IAuthDataSource _dataSource;
  final UserPreference _userPreference;

  @override
  // TODO: implement pref
  UserPreference get pref => _userPreference;

  @override
  Future<AuthResponse> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> loginFromSessionToken(String sessionToken) {
    final response = _dataSource.logInFromSessionToken(sessionToken);
    return response;
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> saveSessionTokenInPref(String sessionToken) async =>
      await _userPreference.setSessionToken(
        sessionToken,
      );

  @override
  Future<void> deleteSessionTokenInPref() async =>
      await _userPreference.deleteSessionToken();
}
