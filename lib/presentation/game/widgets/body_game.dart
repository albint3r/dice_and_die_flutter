import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/game.dart';
import '../../../domain/waiting_room/player.dart';
import 'board.dart';
import 'player_board.dart';
import 'player_board_die.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    final player = state.player;
    print('*-' * 100);
    print(game);
    print(state.player?.id);
    print('*-' * 100);
    if (state.isLoading && game == null) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    Player? opponentPlayer;
    if (player is Player && game is Game) {
      opponentPlayer = player.id == game.p1.id ? game.p2 : game.p1;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayerBoard(
          player: opponentPlayer,
        ),
        PlayerBoard(
          player: state.player,
          isFirstPerson: true,
        )
      ],
    );
  }
}
