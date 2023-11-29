import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/core/types.dart';
import '../../domain/game/i_game_data_source.dart';
import '../../domain/game/i_game_facade.dart';

@Injectable(as: IGameFacade)
class GameFacadeImpl implements IGameFacade {
  GameFacadeImpl(this._dataSource);

  final IGameDataSource _dataSource;
  late final WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  @override
  Stream<dynamic> getGameEvents(String gameId) {
    _channel = _dataSource.getGameChannel(gameId);
    return channel.stream;
  }

  @override
  String generateRandomId() {
    const uuid = Uuid();
    return uuid.v4();
  }

  @override
  void addGameEvent(Json playerInput) {
    // TODO: implement addGameEvent
  }
}
