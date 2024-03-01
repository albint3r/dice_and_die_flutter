import 'package:freezed_annotation/freezed_annotation.dart';

enum EnumGameState {
  @JsonValue('create_new_game')
  createNewGame,
  @JsonValue('waiting_opponent')
  waitingOpponent,
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
  @JsonValue('change_current_player')
  changeCurrentPlayer,
  @JsonValue('finish_game')
  finishGame,
  @JsonValue('disconnect_player')
  disconnectPlayer,
}
