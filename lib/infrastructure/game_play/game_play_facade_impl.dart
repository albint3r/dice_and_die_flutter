import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/src/channel.dart';

import '../../domain/core/types.dart';

import '../../domain/game_play/entities/game.dart';
import '../../domain/game_play/entities/player.dart';
import '../../domain/game_play/enums/emote.dart';
import '../../domain/game_play/enums/enum_game_event.dart';
import '../../domain/game_play/errors/errors.dart';
import '../../domain/game_play/schemas/response.dart';
import '../../domain/game_play/use_case/i_game_play_data_source.dart';
import '../../domain/game_play/use_case/i_game_play_facade.dart';

@Injectable(as: IGamePlayFacade)
class GamePlayFacadeImpl implements IGamePlayFacade {
  GamePlayFacadeImpl(this._dataSource);

  final IGamePlayDataSource _dataSource;
  late WebSocketChannel _channel;

  @override
  WebSocketChannel get channel => _channel;

  @override
  String generateRandomId() => const Uuid().v4();

  @override
  WebSocketChannel getGamePlayChannel(String gameId) {
    return _channel = _dataSource.getGamePlayChannel(gameId);
  }

  @override
  WebSocketChannel getGamePlayAIChannel() {
    return _channel = _dataSource.getGamePlayAIChannel();
  }

  @override
  void rollDice() => _channel.sink.add('{"event": "roll"}');

  @override
  void selectColumn(int index) => _channel.sink.add('{"event": "$index"}');

  @override
  void sendEmote(Emote emote) {
    _channel.sink.add('{"event": "emote", "extras":{"emote":"${emote.name}"}}');
  }

  @override
  ResponseGame loadGamePlay(dynamic data) {
    try {
      final stringData = jsonDecode(data.toString()) as String;
      final jsonData = jsonDecode(stringData) as Json;
      return ResponseGame.fromJson(jsonData);
    } catch (e) {
      throw ErrorLoadingGamePlay(
        'Error fetching Game Play information from server. '
        'This is your $data. This is your error:$e',
      );
    }
  }

  @override
  (Player, Player?) getWinnerPlayer(Game game, Player player) {
    final winnerPlayer = game.winnerPlayer;
    if (winnerPlayer is List<Player?>) {
      return (winnerPlayer[0]!, winnerPlayer[1]);
    }
    throw NoWinnerExistError(
      "You don't have a winner in the get Winner Player.",
    );
  }

  @override
  ResponseEmoteExtras? listeningChatMessage(ResponseGame response) {
    if (response.message == EnumGameEvent.emote.name) {
      ResponseEmoteExtras emoteExtras;
      final extras = response.extras;
      try {
        emoteExtras = ResponseEmoteExtras.fromJson(extras);
      } catch (e) {
        emoteExtras = ResponseEmoteExtras(
          emote: Emote.invalidInputEvent,
          playerId: '',
          time: DateTime.now(),
        );
      }
      if (emoteExtras.emote != Emote.invalidInputEvent) return emoteExtras;
    }
    return null;
  }
}
