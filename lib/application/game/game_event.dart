part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.started(Game? game) = _Started;
  const factory GameEvent.rollDice(int columnIndex) = _RollDice;
}
