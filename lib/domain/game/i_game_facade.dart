import 'package:web_socket_channel/web_socket_channel.dart';

import '../core/types.dart';
import '../waiting_room/game.dart';
import '../waiting_room/player.dart';

abstract interface class IGameFacade {
  WebSocketChannel get channel;

  Stream<dynamic> getGameEvents(String gameId);

  void addGameEvent(Json playerInput);

  String generateRandomId();
  Player? getOpponentPlayer(Player? player, Game? game);
}
