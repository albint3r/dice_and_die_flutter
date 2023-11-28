part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required bool isLoading,
    Game? game,
  }) = _GameState;

  const GameState._();

  factory GameState.initial() => const GameState(
        isLoading: true,
      );
}
