import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserPreference {
  late final SharedPreferences _prefs;
  final String _sessionToken = 'sessionToken';
  final String _challengeGameId = 'challengeGameId';

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> setSessionToken(String sessionToken) async =>
      await _prefs.setString(
        _sessionToken,
        sessionToken,
      );

  Future<void> setChallengeGameId(String challengeGameId) async =>
      await _prefs.setString(
        _challengeGameId,
        challengeGameId,
      );

  Future<String> getSessionToken() async =>
      _prefs.getString(
        _sessionToken,
      ) ??
      '';

  Future<String> getChallengeGameId() async =>
      _prefs.getString(
        _challengeGameId,
      ) ??
      '';

  Future<void> deleteSessionToken() async => _prefs.remove(_sessionToken);

  Future<void> deleteChallengeGameId() async => _prefs.remove(_challengeGameId);
}
