part of 'game_life_bloc.dart';

@freezed
class GameLifeState with _$GameLifeState {
  const factory GameLifeState({
    Player? player,
    Player? opponentPlayer,
    Game? game,
  }) = _GameLifeState;

  factory GameLifeState.initial() => const GameLifeState();
}
