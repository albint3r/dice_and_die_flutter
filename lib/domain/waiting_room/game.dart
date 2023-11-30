import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';
import 'game_state.dart';
import 'player.dart';

part 'game.freezed.dart';

part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required String id,
    required Player p1,
    required Player? p2,
    @JsonKey(name: 'current_player') Player? currentPlayer,
    @JsonKey(name: 'winner_player') required Player? winnerPlayer,
    required int turn,
    GameAppState? state,
  }) = _Game;

  const Game._();

  bool get isFull => p2 is Player;

  factory Game.fromJson(Json json) => _$GameFromJson(json);
}
