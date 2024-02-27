import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../application/sounds_effects/sounds_effects_bloc.dart';
import '../../../domain/game2/entities/player.dart';
import 'first_person/first_person_area.dart';
import 'second_person/second_person_area.dart';
import 'waiting_game_room.dart';

class BodyGamePlay extends StatelessWidget {
  const BodyGamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final gamePlay = context.watch<GamePlayBloc>().state;
    final isWaitingOpponent = gamePlay.game?.p2 == null;
    if (gamePlay.isLoading) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isWaitingOpponent) {
      return const WaitingGameRoom();
    }
    return MultiBlocListener(
      listeners: [
        BlocListener<GamePlayBloc, GamePlayState>(
          listenWhen: (pre, curr) =>
              pre.game?.winnerPlayer != curr.game?.winnerPlayer &&
              curr.game?.winnerPlayer is List<Player?>,
          listener: (context, state) => context.read<GamePlayBloc>().add(
                const GamePlayEvent.getWinnerPlayer(),
              ),
        ),
        BlocListener<SoundsEffectsBloc, SoundsEffectsState>(
          listenWhen: (pre, curr) =>
              pre.isRollDiceSoundComplete != curr.isRollDiceSoundComplete &&
              curr.isRollDiceSoundComplete,
          listener: (context, state) => context.read<GamePlayBloc>().add(
                const GamePlayEvent.rollDice(),
              ),
        )
      ],
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SecondPersonArea(),
          Divider(color: Colors.black, height: 10, thickness: 5),
          FirstPersonArea(),
        ],
      ),
    );
  }
}
