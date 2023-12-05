part of 'game_notifications_bloc.dart';

@freezed
class GameNotificationsEvent with _$GameNotificationsEvent {
  const factory GameNotificationsEvent.update({
    required Game game,
  }) = _Update;
}
