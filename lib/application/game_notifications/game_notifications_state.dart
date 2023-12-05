part of 'game_notifications_bloc.dart';

@freezed
class GameNotificationsState with _$GameNotificationsState {
  const factory GameNotificationsState({
    required GameAppState gameAppState,
  }) = _GameNotificationsState;

  factory GameNotificationsState.initial() => const GameNotificationsState(
        gameAppState: GameAppState.waitingPlayers,
      );
}
