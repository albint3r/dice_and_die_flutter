part of 'sounds_effects_bloc.dart';

@freezed
class SoundsEffectsState with _$SoundsEffectsState {
  const factory SoundsEffectsState({
    AudioPlayer? rollDiceAudioPlayer,
    AudioPlayer? throwDiceAudioPlayer,
    // todo: remove this variable after remove all the last game project.
    required bool isRollDiceSoundComplete,
  }) = _SoundsEffectsState;

  factory SoundsEffectsState.initial() => const SoundsEffectsState(
        isRollDiceSoundComplete: false,
      );
}
