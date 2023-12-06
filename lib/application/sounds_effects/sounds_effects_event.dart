part of 'sounds_effects_bloc.dart';

@freezed
class SoundsEffectsEvent with _$SoundsEffectsEvent {
  const factory SoundsEffectsEvent.started() = _Started;
  const factory SoundsEffectsEvent.playRollDice() = _PlayRollDice;
  const factory SoundsEffectsEvent.stopRollDice() = _StopRollDice;
}
