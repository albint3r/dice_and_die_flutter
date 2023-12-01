part of 'waiting_room_bloc.dart';

@freezed
class WaitingRoomState with _$WaitingRoomState {
  const factory WaitingRoomState({
    required bool isLoading,
    required List<Game> games,
    required int connectedPlayers,
    WebSocketChannel? channel,
  }) = _WaitingRoomState;

  factory WaitingRoomState.initial() => const WaitingRoomState(
        isLoading: true,
        games: [],
        connectedPlayers: 0,
      );
}
