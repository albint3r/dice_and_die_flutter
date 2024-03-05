part of 'podium_bloc.dart';

@freezed
class PodiumEvent with _$PodiumEvent {
  const factory PodiumEvent.started(int rankId) = _Started;
  const factory PodiumEvent.playWinSound() = _PlayWinSound;
  const factory PodiumEvent.playLoseSound() = _PlayLoseSound;
}
