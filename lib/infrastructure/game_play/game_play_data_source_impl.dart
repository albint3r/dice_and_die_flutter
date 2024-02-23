import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/game2/use_case/i_game_play_data_source.dart';

@Injectable(as: IGamePlayDataSource)
class GamePlayDataSourceImpl implements IGamePlayDataSource {
  @override
  WebSocketChannel getGamePlayChannel(String gameId) {
    // TODO: implement getGamePlayChannel
    throw UnimplementedError();
  }
}
