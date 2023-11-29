import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/game.dart';
import '../../../domain/waiting_room/player.dart';
import '../../../infrastructure/game/board.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    print('*-' * 100);
    print(game);
    print('*-' * 100);
    if (state.isLoading && game is Game) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        if (game?.p1 is Player)
          Board(
            player: game?.p1,
          ),
        if (game?.p2 is Player)
          Board(
            player: game?.p2,
          ),
      ],
    );
  }
}
