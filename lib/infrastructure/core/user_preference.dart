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
