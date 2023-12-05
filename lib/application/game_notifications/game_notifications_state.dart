part of 'game_notifications_bloc.dart';

@freezed
class GameNotificationsState with _$GameNotificationsState {
  const factory GameNotificationsState({
    required bool showNotifications,
  }) = _GameNotificationsState;

  factory GameNotificationsState.initial() =>
      const GameNotificationsState(
        showNotifications: false,
      );
}
