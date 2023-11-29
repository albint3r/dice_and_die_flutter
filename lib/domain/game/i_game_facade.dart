import 'package:web_socket_channel/web_socket_channel.dart';

import '../core/types.dart';
import '../waiting_room/game.dart';

abstract interface class IGameFacade {
  WebSocketChannel get channel;

  Stream<dynamic> getGameEvents(String gameId);

  void addGameEvent(Json playerInput);

  String generateRandomId();
}
