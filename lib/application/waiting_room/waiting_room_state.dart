part of 'waiting_room_bloc.dart';

@freezed
class WaitingRoomState with _$WaitingRoomState {
  const factory WaitingRoomState({
    required bool isLoading,
  }) = _WaitingRoomState;

  factory WaitingRoomState.initial() => const WaitingRoomState(
        isLoading: true,
      );
}
