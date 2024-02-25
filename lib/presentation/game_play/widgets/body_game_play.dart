import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../../domain/game2/entities/player.dart';
import 'first_person/first_person_area.dart';
import 'second_person/second_person_area.dart';

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
    return MultiBlocListener(
      listeners: [
        BlocListener<GamePlayBloc, GamePlayState>(
          listenWhen: (pre, curr) =>
              pre.game?.winnerPlayer != curr.game?.winnerPlayer &&
              curr.game?.winnerPlayer is Player,
          listener: (context, state) {
            print('We have a winner');
          },
        )
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
