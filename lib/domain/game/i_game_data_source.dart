import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IGameDataSource {
  WebSocketChannel getGameChannel(String gameId);

  Future<void> disconnect(String gameId);
}
