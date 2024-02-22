part of 'lobby_bloc.dart';

@freezed
class LobbyState with _$LobbyState {
  const factory LobbyState({
    required bool isLoading,
    required int totalPlayer,
    required List<Game> games,
  }) = _LobbyState;

  factory LobbyState.initial() => const LobbyState(
        isLoading: true,
        totalPlayer: 0,
        games: <Game>[],
      );
}
