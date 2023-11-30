import 'package:web_socket_channel/web_socket_channel.dart';

import 'game.dart';
import 'responses.dart';

abstract interface class IWaitingRoomDFacade {
  WebSocketChannel get channel;

  Future<List<Game>> getWaitingRooms();

  Stream<dynamic> getWaitingRoomsEvents();

  List<Game> extractListOfGames(ActiveGamesResponses activeGamesResponses);
}
