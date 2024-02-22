import 'package:freezed_annotation/freezed_annotation.dart';

import '../../waiting_room/player.dart';
import '../enums/enum_game_state.dart';

part 'game.freezed.dart';

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
}
