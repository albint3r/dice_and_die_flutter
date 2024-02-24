part of 'game_play_bloc.dart';

@freezed
class GamePlayEvent with _$GamePlayEvent {
  const factory GamePlayEvent.createGame() = _CreateGame;

  const factory GamePlayEvent.joinGame(
    Game game,
  ) = _JoinGame;

  const factory GamePlayEvent.rollDice() = _RollDice;

  const factory GamePlayEvent.selectColumn(int index) = _SelectColumn;
}
