import 'package:web_socket_channel/web_socket_channel.dart';

import 'game.dart';

abstract interface class IWaitingRoomDataSource {
  Future<List<Game>> getWaitingRooms();



  WebSocketChannel getWebsocketWaitingRooms();
}
