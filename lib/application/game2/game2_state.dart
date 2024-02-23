part of 'game2_bloc.dart';

@freezed
class Game2State with _$Game2State {
  const factory Game2State({
    required bool isLoading,
    Game? game,
    Player? player,
    WebSocketChannel? channel,
  }) = _Game2State;

  factory Game2State.initial() => const Game2State(
        isLoading: true,
      );
}
