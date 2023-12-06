part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.started(Game? game) = _Started;
  const factory GameEvent.rollDice() = _RollDice;
  const factory GameEvent.selectColumn(int columnIndex) = _SelectColumn;
  const factory GameEvent.cancelMatch() = _CancelMatch;
}
