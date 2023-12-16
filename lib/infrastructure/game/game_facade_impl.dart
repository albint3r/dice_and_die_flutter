import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/core/types.dart';
import '../../domain/game/i_game_data_source.dart';
import '../../domain/game/i_game_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';
import '../core/user_preference.dart';

@Injectable(as: IGameFacade)
class GameFacadeImpl implements IGameFacade {
  GameFacadeImpl(
    this._dataSource,
    this._pref,
  );

  final UserPreference _pref;
  final IGameDataSource _dataSource;
  late final WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  bool get _existChannel => _channel is WebSocketChannel;

  @override
  UserPreference get pref => _pref;

  @override
  String generateRandomId() => const Uuid().v4();

  @override
  Stream<dynamic> getGameEvents(
    String gameId,
    String sessionToken,
  ) {
    _channel = _dataSource.getGameChannel(
      gameId,
      sessionToken,
    );
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

  @override
  (Game, Player) getGameAndPlayerMatch(String dataText, bool isPlayer1) {
    // Convert Data in Json
    final Json data = jsonDecode(dataText) as Json;
    // Get Game Update

    Game? game;
    final Json match = jsonDecode(data['match'] as String) as Json;
    game = Game.fromJson(match);
    final Player player;
    if (isPlayer1) {
      player = game.p1;
    } else {
      player = game.p2!;
    }

    return (game, player);
  }

  @override
  Future<void> disconnectChannel() async => await _channel.sink.close();
}
