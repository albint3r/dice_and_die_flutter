import 'package:web_socket_channel/web_socket_channel.dart';

import '../../infrastructure/core/user_preference.dart';
import 'game.dart';
import 'responses.dart';

abstract interface class IWaitingRoomDFacade {
  UserPreference get pref;

  WebSocketChannel get channel;

  Future<List<Game>> getWaitingRooms();

  Stream<dynamic> getWaitingRoomsEvents(String tokenSession);

  void addWaitingRoomsEvent(String playerInput);

  List<Game> extractListOfGames(ActiveGamesResponses activeGamesResponses);

  (List<Game>, int) getGamesAndActiveUsers(String dataText);
}
