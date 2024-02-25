import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../enums/enum_game_state.dart';
import 'player.dart';

part 'game.freezed.dart';

part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    @JsonKey(name: 'game_id') required String gameId,
    required Player p1,
    Player? p2,
    @JsonKey(name: 'current_player') Player? currentPlayer,
    @JsonKey(name: 'winner_player') Player? winnerPlayer,
    @JsonKey(name: 'current_turn') required int currentTurn,
    @JsonKey(name: 'state') required EnumGameState? gameState,
  }) = _Game;

  const Game._();

  factory Game.fromJson(Json json) => _$GameFromJson(json);

  bool get isFull => p2 is Player;
}
