import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/game2/use_case/i_game_play_data_source.dart';

@Injectable(as: IGamePlayDataSource)
class GamePlayDataSourceImpl implements IGamePlayDataSource {
  const GamePlayDataSourceImpl(this._uri);
  final Uri _uri;
  @override
  WebSocketChannel getGamePlayChannel(String gameId) {
    const path = '/v2/game/FAKE_GAME_ID/I009';
    final uri = _uri.replace(scheme: 'ws', path: path);
    return WebSocketChannel.connect(uri);
  }
}
