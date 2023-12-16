import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IGameDataSource {
  WebSocketChannel getGameChannel(
    String gameId,
    String sessionToken,
  );
}
