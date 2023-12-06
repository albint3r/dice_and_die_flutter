import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sounds_effects_bloc.freezed.dart';

part 'sounds_effects_event.dart';

part 'sounds_effects_state.dart';

@injectable
class SoundsEffectsBloc extends Bloc<SoundsEffectsEvent, SoundsEffectsState> {
  SoundsEffectsBloc() : super(SoundsEffectsState.initial()) {
    on<_Started>((event, emit) {
      // TODO: implement event handler
    });
    on<_PlayRollDice>((event, emit) async {
      emit(
        state.copyWith(
          isRollDiceSoundComplete: false,
          rollDiceAudioPlayer: AudioPlayer(),
        ),
      );
      final rollDiceAudioPlayer = state.rollDiceAudioPlayer;
      await rollDiceAudioPlayer!.setSource(
        AssetSource(
          'sounds/dice_random_rolling_effect.mp3',
        ),
      );
      rollDiceAudioPlayer.resume();
      // Check if the sound stop. This will alert the dice auto throw
      await emit.forEach(
        rollDiceAudioPlayer.eventStream,
        onData: (data) {
          if (rollDiceAudioPlayer.state == PlayerState.completed) {
            return state.copyWith(
              isRollDiceSoundComplete: true,
            );
          }
          return state;
        },
      );
    });
    on<_StopRollDice>((event, emit) async {
      state.rollDiceAudioPlayer?.stop();
    });
  }
}
