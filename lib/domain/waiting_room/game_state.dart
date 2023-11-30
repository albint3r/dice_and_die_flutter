import 'package:freezed_annotation/freezed_annotation.dart';

enum GameAppState {
  @JsonValue('waiting_players')
  waitingPlayers,
  @JsonValue('roll_dice')
  rollDice,
  @JsonValue('select_column')
  selectColumn,
  @JsonValue('destroy_opponent_target_column')
  destroyOpponentTargetColumn,
  @JsonValue('add_dice_to_column')
  addDiceToColumn,
  @JsonValue('update_players_points')
  updatePlayersPoints,
  @JsonValue('finish_game')
  finishGame,
  @JsonValue('disconnect_player')
  disconnectPlayer,
}
