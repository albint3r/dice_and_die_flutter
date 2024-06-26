import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
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
  );

  final IAuthDataSource _dataSource;
  final UserPreference _userPreference;

  @override
  UserPreference get pref => _userPreference;

  @override
  Future<AuthResponse> logIn(String email, String password) =>
      _dataSource.logIn(
        email,
        password,
      );

  @override
  Future<void> logOut() async {
    await _userPreference.deleteSessionToken();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

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
    String referralCode,
  ) =>
      _dataSource.signIn(
        email,
        name,
        password,
        referralCode,
      );

  @override
  Future<void> saveSessionTokenInPref(String sessionToken) =>
      _userPreference.setSessionToken(
        sessionToken,
      );

  @override
  Future<void> deleteSessionTokenInPref() =>
      _userPreference.deleteSessionToken();

  @override
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await _getGoogleUserByPlatform();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;
    if (googleAuth is GoogleSignInAuthentication) {
      final googleToken = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(
        googleToken,
      );
    }
    throw Exception('Google Auth Failed in [signInWithGoogle]');
  }

  @override
  Future<AuthResponse> logInWithGoogle(UserCredential authCredentials) =>
      _dataSource.logInWithGoogle(
        authCredentials.user!.uid,
      );

  Future<GoogleSignInAccount?> _getGoogleUserByPlatform() async {
    final GoogleSignInAccount? googleUser;
    if (kIsWeb) {
      googleUser = await GoogleSignIn().signIn();
    } else {
      googleUser = await GoogleSignIn().signIn();
    }
    return googleUser;
  }
}
