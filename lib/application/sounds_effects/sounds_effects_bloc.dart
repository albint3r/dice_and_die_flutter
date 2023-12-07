import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../domain/game/errors.dart';

part 'sounds_effects_bloc.freezed.dart';

part 'sounds_effects_event.dart';

part 'sounds_effects_state.dart';

@injectable
class SoundsEffectsBloc extends Bloc<SoundsEffectsEvent, SoundsEffectsState> {
  SoundsEffectsBloc() : super(SoundsEffectsState.initial()) {
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

      try {
        if (rollDiceAudioPlayer.state != PlayerState.disposed) {
          await rollDiceAudioPlayer.resume();
        }
      } catch (e) {
        l.d(
          SoundGameError(
            'The sound controller was disposed. This is common error after the game is finished and the dispose controller listener triggers',
          ),
        );
      }
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
      // When the dice stop the throw dice start.
      await state.rollDiceAudioPlayer?.stop();
      emit(
        state.copyWith(
          throwDiceAudioPlayer: AudioPlayer(),
        ),
      );
      await state.throwDiceAudioPlayer!.setSource(
        AssetSource('sounds/dice_roll.mp3'),
      );
      state.throwDiceAudioPlayer?.resume();
    });
    on<_DisposeRollDice>((event, emit) async {
      // When the dice stop the throw dice start.
      await state.rollDiceAudioPlayer?.dispose();
      await state.throwDiceAudioPlayer?.dispose();
    });
  }
}
