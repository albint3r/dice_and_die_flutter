import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class IGamePlayDataSource {
  WebSocketChannel getGamePlayChannel(String gameId);
  WebSocketChannel getGamePlayAIChannel();
}
