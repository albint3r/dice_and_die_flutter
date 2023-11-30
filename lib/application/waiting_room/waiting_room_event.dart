part of 'waiting_room_bloc.dart';

@freezed
class WaitingRoomEvent with _$WaitingRoomEvent {
  const factory WaitingRoomEvent.started() = _Started;
  const factory WaitingRoomEvent.reloadEvents() = _ReloadEvents;
}
