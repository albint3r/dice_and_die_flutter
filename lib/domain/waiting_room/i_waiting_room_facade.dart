import 'package:web_socket_channel/web_socket_channel.dart';

import '../core/types.dart';
import 'game.dart';
import 'responses.dart';

abstract interface class IWaitingRoomDFacade {
  WebSocketChannel get channel;

  Future<List<Game>> getWaitingRooms();

  Stream<dynamic> getWaitingRoomsEvents();

  void addWaitingRoomsEvent(String playerInput);

  List<Game> extractListOfGames(ActiveGamesResponses activeGamesResponses);

  (List<Game>, int) getGamesAndActiveUsers(String dataText);
}
