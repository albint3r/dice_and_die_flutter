part of 'game_play_bloc.dart';

@freezed
class GamePlayState with _$GamePlayState {
  const factory GamePlayState({
    required bool isLoading,
    Game? game,
    Player? player,
    Player? opponentPlayer,
    required bool existGameError,
    ResponseEmoteExtras? emoteExtrasPlayer,
    required bool isVisiblePlayerEmote,
    ResponseEmoteExtras? emoteExtrasOpponent,
    required bool isVisibleOpponentEmote,
  }) = _GamePlayState;

  factory GamePlayState.initial() => const GamePlayState(
        isLoading: true,
        isVisiblePlayerEmote: false,
        isVisibleOpponentEmote: false,
        existGameError: false,
      );
}
