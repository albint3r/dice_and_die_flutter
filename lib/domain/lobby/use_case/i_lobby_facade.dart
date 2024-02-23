import 'package:web_socket_channel/web_socket_channel.dart';

import '../schemas/response.dart';

abstract interface class ILobbyFacade {
  WebSocketChannel get channel;

  WebSocketChannel getLobbyChannel();

  ResponseLobby loadActiveGames(dynamic data);

  void updateLobbyActiveGames();
}
