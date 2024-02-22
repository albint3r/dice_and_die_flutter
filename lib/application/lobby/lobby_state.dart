part of 'lobby_bloc.dart';

@freezed
class LobbyState with _$LobbyState {
  const factory LobbyState({
    required bool isLoading,
    required int totalPlayer,
    required Lobby lobby,
  }) = _LobbyState;

  factory LobbyState.initial() => const LobbyState(
        isLoading: true,
        totalPlayer: 0,
        lobby: Lobby(
          activeGames: {},
        ),
      );
}
