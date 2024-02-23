import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IGameFacade {
  WebSocketChannel getGameWebsocketChannel(String gameId);

  void rollDice();

  void selectColumn();

  void sendEmote();
}
