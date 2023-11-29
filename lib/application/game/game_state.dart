part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required bool isLoading,
    Game? game,
    Player? player,
    WebSocketChannel? channel,
  }) = _GameState;

  const GameState._();

  factory GameState.initial() => const GameState(
        isLoading: true,
      );
}
