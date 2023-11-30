import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game/i_game_data_source.dart';
import '../../domain/waiting_room/game.dart';

@Injectable(as: IGameDataSource)
class GameDataSourceImpl implements IGameDataSource {
  @override
  Future<void> disconnect(String gameId) {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  WebSocketChannel getGameChannel(String gameId) {
    final uri = Uri.parse('ws://192.168.1.71:8000/ws/v1/game/$gameId');
    return WebSocketChannel.connect(uri);
  }
}
