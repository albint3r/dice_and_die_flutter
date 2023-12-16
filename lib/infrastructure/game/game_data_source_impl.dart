import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game/i_game_data_source.dart';
import '../../presentation/core/theme/const_values.dart';

@Injectable(as: IGameDataSource)
class GameDataSourceImpl implements IGameDataSource {
  @override
  WebSocketChannel getGameChannel(
    String gameId,
    String sessionToken,
  ) {
    final uri = Uri.parse('$websocketUri/ws/v1/game/$gameId/$sessionToken');
    return WebSocketChannel.connect(uri);
  }
}
