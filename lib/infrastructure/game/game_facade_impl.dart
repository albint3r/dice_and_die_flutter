import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game/i_game_data_source.dart';
import '../../domain/game/i_game_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';

@Injectable(as: IGameFacade)
class GameFacadeImpl implements IGameFacade {
  GameFacadeImpl(this._dataSource);

  final IGameDataSource _dataSource;
  late final WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  bool get _existChannel => _channel is WebSocketChannel;

  @override
  String generateRandomId() => const Uuid().v4();

  @override
  Stream<dynamic> getGameEvents(String gameId) {
    _channel = _dataSource.getGameChannel(gameId);
    return channel.stream;
  }

  @override
  void addGameEvent(String playerInput) {
    if (_existChannel) _channel.sink.add(playerInput);
  }

  @override
  Player? getOpponentPlayer(Player? player, Game? game) {
    if (player is Player && game is Game) {
      return player.id == game.p1.id ? game.p2 : game.p1;
    }
    return null;
  }
}
