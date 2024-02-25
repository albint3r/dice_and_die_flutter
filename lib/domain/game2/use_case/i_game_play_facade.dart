import 'package:web_socket_channel/web_socket_channel.dart';

import '../schemas/response.dart';

abstract interface class IGamePlayFacade {
  String generateRandomId();

  WebSocketChannel getGamePlayChannel(String gameId);

  ResponseGame loadGamePlay(dynamic data);

  void rollDice();

  void selectColumn(int index);

  void sendEmote();
}
