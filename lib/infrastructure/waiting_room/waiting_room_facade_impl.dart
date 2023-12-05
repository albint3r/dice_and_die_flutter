import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:l/l.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/i_waiting_room_data_source.dart';
import '../../domain/waiting_room/i_waiting_room_facade.dart';
import '../../domain/waiting_room/responses.dart';

@Injectable(as: IWaitingRoomDFacade)
class WaitingRoomFacadeImpl implements IWaitingRoomDFacade {
  WaitingRoomFacadeImpl(this._dataSource);

  final IWaitingRoomDataSource _dataSource;
  late final WebSocketChannel _channel;

  bool get _existChannel => _channel is WebSocketChannel;

  @override
  WebSocketChannel get channel => _channel;

  @override
  Future<List<Game>> getWaitingRooms() => _dataSource.getWaitingRooms();

  @override
  Stream getWaitingRoomsEvents() {
    _channel = _dataSource.getWebsocketWaitingRooms();
    return _channel.stream;
  }

  @override
  List<Game> extractListOfGames(ActiveGamesResponses activeGamesResponses) {
    final List<Game> result = [];
    for (final e in activeGamesResponses.response.entries) {
      l.d(e);
      final gameResponse = e.value;
      if (gameResponse is Json) {
        result.add(Game.fromJson(gameResponse));
      }
    }
    return result;
  }

  @override
  void addWaitingRoomsEvent(String playerInput) {
    if (_existChannel) _channel.sink.add(playerInput);
  }

  @override
  (List<Game>, int) getGamesAndActiveUsers(String dataText) {
    final Json response = jsonDecode(dataText) as Json;
    final status = jsonDecode(response['status'] as String) as Json;
    final connectedPlayers = response['connected_players'] as int;
    final activeGamesResponses = ActiveGamesResponses.fromJson(status);
    final List<Game> games = extractListOfGames(activeGamesResponses);
    return (games, connectedPlayers);
  }
}
