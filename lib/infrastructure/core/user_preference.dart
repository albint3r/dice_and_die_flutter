import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserPreference {
  late final SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> setSessionToken(String sessionToken) async =>
      await _prefs.setString(
        'sessionToken',
        sessionToken,
      );

  Future<String> getSessionToken() async =>
      _prefs.getString(
        'sessionToken',
      ) ??
      '';

  Future<void> deleteSessionToken() async => _prefs.remove(
        'sessionToken',
      );
}
