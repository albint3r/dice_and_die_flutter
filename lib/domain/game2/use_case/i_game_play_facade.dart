import 'package:web_socket_channel/web_socket_channel.dart';

import '../schemas/response.dart';

abstract interface class IGamePlayFacade {
  WebSocketChannel getGamePlayChannel();

  ResponseGame loadGamePlay(dynamic data);

  void rollDice();

  void selectColumn(int index);

  void sendEmote();
}
