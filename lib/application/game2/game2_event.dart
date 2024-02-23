part of 'game2_bloc.dart';

@freezed
class Game2Event with _$Game2Event {
  const factory Game2Event.createGame() = _CreateGame;

  const factory Game2Event.joinGame() = _JoinGame;
}
