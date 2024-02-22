import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserPreference {
  late final SharedPreferences _prefs;
  final String _sessionToken = 'sessionToken';

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> setSessionToken(String sessionToken) async =>
      await _prefs.setString(
        _sessionToken,
        sessionToken,
      );

  Future<String> getSessionToken() async =>
      _prefs.getString(
        _sessionToken,
      ) ??
      '';

  Future<void> deleteSessionToken() async => _prefs.remove(_sessionToken);
}

// @LazySingleton()
// class SharedPref {
//   SharedPref(this._pref);
//
//   final String _sessionToken = 'sessionToken';
//   final SharedPreferences _pref;
//
//   String getToken() {
//     final sessionToken = _pref.getString(_sessionToken);
//     return sessionToken is String ? "Bearer $sessionToken" : '';
//   }
//
//   Future<void> setToken(String sessionToken) => _pref.setString(
//     _sessionToken,
//     sessionToken,
//   );
//
//   Future<void> deleteToken() => _pref.remove(_sessionToken);
// }
