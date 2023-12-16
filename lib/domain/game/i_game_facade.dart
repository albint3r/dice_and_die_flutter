import 'package:web_socket_channel/web_socket_channel.dart';

import '../../infrastructure/core/user_preference.dart';
import '../auth/schemas/auth_response.dart';
import '../core/types.dart';
import '../waiting_room/game.dart';
import '../waiting_room/player.dart';

abstract interface class IGameFacade {
  UserPreference get pref;

  WebSocketChannel get channel;

  Future<void> disconnectChannel();

  Stream<dynamic> getGameEvents(
    String gameId,
    String sessionToken,
  );

  void addGameEvent(
    String playerInput,
  );

  String generateRandomId();

  Player? getOpponentPlayer(
    Player? player,
    Game? game,
  );

  (Game, Player) getGameAndPlayerMatch(
    String dataText,
    bool isPlayer1,
  );

  Future<AuthResponse> updateUserProfile();
}
