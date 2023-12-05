part of 'game_notifications_bloc.dart';

@freezed
class GameNotificationsEvent with _$GameNotificationsEvent {
  const factory GameNotificationsEvent.started() = _Started;
}
