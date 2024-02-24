import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';
import '../../domain/game2/schemas/response.dart';
import '../../domain/game2/use_case/i_game_play_data_source.dart';
import '../../domain/game2/use_case/i_game_play_facade.dart';

@Injectable(as: IGamePlayFacade)
class GamePlayFacadeImpl implements IGamePlayFacade {
  GamePlayFacadeImpl(this._dataSource);

  final IGamePlayDataSource _dataSource;
  late WebSocketChannel _channel;

  @override
  WebSocketChannel getGamePlayChannel() {
    return _channel = _dataSource.getGamePlayChannel('gameId');
  }

  @override
  void rollDice() {
    // TODO: implement rollDice
  }

  @override
  void selectColumn() {
    // TODO: implement selectColumn
  }

  @override
  void sendEmote() {
    // TODO: implement sendEmote
  }

  @override
  ResponseGame loadGamePlay(dynamic data) {
    final stringData = jsonDecode(data.toString()) as String;
    final jsonData = jsonDecode(stringData) as Json;
    return ResponseGame.fromJson(jsonData);
  }
}
