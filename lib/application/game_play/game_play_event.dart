part of 'game_play_bloc.dart';

@freezed
class GamePlayEvent with _$GamePlayEvent {
  const factory GamePlayEvent.createGame() = _CreateGame;
  const factory GamePlayEvent.joinGame() = _JoinGame;
}
