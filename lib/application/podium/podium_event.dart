part of 'podium_bloc.dart';

@freezed
class PodiumEvent with _$PodiumEvent {
  const factory PodiumEvent.started(int rankId) = _Started;
}
