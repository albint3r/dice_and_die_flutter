part of 'sounds_effects_bloc.dart';

@freezed
class SoundsEffectsState with _$SoundsEffectsState {
  const factory SoundsEffectsState({
    AudioPlayer? rollDiceAudioPlayer,
    required bool isRollDiceSoundComplete,
  }) = _SoundsEffectsState;

  factory SoundsEffectsState.initial() => const SoundsEffectsState(
        isRollDiceSoundComplete: false,
      );
}
