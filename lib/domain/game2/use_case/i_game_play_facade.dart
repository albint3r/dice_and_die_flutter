import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IGamePlayFacade {
  WebSocketChannel getGamePlayChannel();

  void rollDice();

  void selectColumn();

  void sendEmote();
}
