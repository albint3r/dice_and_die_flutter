part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required bool isLoading,
    required bool isCancelMatch,
    Game? game,
    Player? player,
    Player? opponentPlayer,
    WebSocketChannel? channel,
  }) = _GameState;

  const GameState._();

  factory GameState.initial() => const GameState(
        isLoading: true,
        isCancelMatch: false,
      );
}
