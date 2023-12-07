part of 'game_life_bloc.dart';

@freezed
class GameLifeEvent with _$GameLifeEvent {
  const factory GameLifeEvent.updatePoints({
    required Game game,
    required Player player,
  }) = _UpdatePoints;
}
