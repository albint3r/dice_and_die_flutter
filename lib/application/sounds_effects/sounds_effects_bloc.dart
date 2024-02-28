import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../domain/game2/errors/errors.dart';


part 'sounds_effects_bloc.freezed.dart';

part 'sounds_effects_event.dart';

part 'sounds_effects_state.dart';

@injectable
class SoundsEffectsBloc extends Bloc<SoundsEffectsEvent, SoundsEffectsState> {
  SoundsEffectsBloc() : super(SoundsEffectsState.initial()) {
    on<_PlayRollDice>((event, emit) async {
      try {
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

        if (rollDiceAudioPlayer.state != PlayerState.disposed) {
          await rollDiceAudioPlayer.resume();
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
      } catch (e) {
        l.e(
          SoundGameError(
            'The sound controller was disposed. This is common error after the '
            'game is finished and the dispose controller listener triggers: $e',
          ),
        );
      }
    });
    on<_StopRollDice>((event, emit) async {
      // When the dice stop the throw dice start.
      try {
        await state.rollDiceAudioPlayer?.stop();
      } catch (e, stackTrace) {
        throw SoundGameError(
          'The Sound Controller have Android Problems: $e',
        );
      }

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
