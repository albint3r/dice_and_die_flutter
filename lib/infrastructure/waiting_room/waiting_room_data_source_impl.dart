import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/i_waiting_room_data_source.dart';
import '../../domain/waiting_room/responses.dart';
import '../../presentation/core/theme/const_values.dart';

@Injectable(as: IWaitingRoomDataSource)
class WaitingRoomDataSourceImpl implements IWaitingRoomDataSource {
  WaitingRoomDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Game>> getWaitingRooms() async {
    final response = await _dio.get('/v1/waiting_rooms');
    final data = response.data as Json;
    final activeGamesResponses = ActiveGamesResponses.fromJson(data);
    final List<Game> result = [];
    for (final e in activeGamesResponses.response.entries) {
      final gameResponse = e.value;
      if (gameResponse is Json) {
        result.add(Game.fromJson(gameResponse));
      }
    }
    return result;
  }

  @override
  WebSocketChannel getWebsocketWaitingRooms(String sessionToken) {
    final uri = Uri.parse('$websocketUri/ws/v1/waiting_rooms/$sessionToken');
    return WebSocketChannel.connect(uri);
  }
}
