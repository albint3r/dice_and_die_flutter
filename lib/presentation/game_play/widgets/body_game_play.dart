import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import 'first_person/first_person_area.dart';
import 'second_person/second_person_area.dart';
import 'waiting_game_room.dart';

class BodyGamePlay extends StatelessWidget {
  const BodyGamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final gamePlay = context.watch<GamePlayBloc>().state;
    final isWaitingOpponent = gamePlay.game?.p2 == null;
    if (gamePlay.existGameError) {
      return const WaitingGameRoom(
        'Connection failed.\nReturning to the lobby...',
        isButton: false,
      );
    }
    if (gamePlay.isLoading) {
      return const WaitingGameRoom(
        'Validating\nWaiting Room',
      );
    }
    if (isWaitingOpponent) {
      return const WaitingGameRoom(
        'Waiting Player\nJoin Match',
      );
    }
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        SecondPersonArea(),
        Divider(color: Colors.black, height: 10, thickness: 5),
        FirstPersonArea(),
      ],
    );
  }
}
