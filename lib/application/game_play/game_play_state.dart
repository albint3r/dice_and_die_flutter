part of 'game_play_bloc.dart';

@freezed
class GamePlayState with _$GamePlayState {
  const factory GamePlayState({
    required bool isLoading,
    Game? game,
    Player? player,
  }) = _GamePlayState;

  factory GamePlayState.initial() => const GamePlayState(
        isLoading: true,
      );
}
