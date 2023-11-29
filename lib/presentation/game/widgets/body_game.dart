import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/game.dart';
import '../../../domain/waiting_room/player.dart';
import 'player_game_area.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;

    if (state.isLoading && game == null) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayerGameArea(
          player: opponentPlayer,
        ),
        PlayerGameArea(
          player: player,
          isFirstPerson: true,
        )
      ],
    );
  }
}
