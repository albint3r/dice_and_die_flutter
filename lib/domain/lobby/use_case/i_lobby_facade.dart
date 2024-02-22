import 'package:web_socket_channel/web_socket_channel.dart';

import '../entities/lobby.dart';

abstract interface class ILobbyFacade {
  WebSocketChannel get channel;

  WebSocketChannel getLobbyChannel();

  void loadActiveGames(dynamic data);
}
