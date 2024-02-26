import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../domain/game2/entities/player.dart';
import '../../../domain/game2/enums/enum_game_state.dart';
import 'first_person/first_person_area.dart';
import 'second_person/second_person_area.dart';
import 'waiting_game_room.dart';

class BodyGamePlay extends StatelessWidget {
  const BodyGamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final gamePlay = context.watch<GamePlayBloc>().state;
    if (gamePlay.isLoading) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (gamePlay.game?.gameState == EnumGameState.waitingOpponent ||
        gamePlay.game?.p2 == null) {
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
      ],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SecondPersonArea(),
          Divider(color: Colors.black, height: 10, thickness: 5),
          FirstPersonArea(),
        ],
      ),
    );
  }
}
