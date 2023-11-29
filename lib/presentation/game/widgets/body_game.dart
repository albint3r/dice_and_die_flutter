import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/player.dart';
import '../../core/router/app_router.dart';
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
    final winnerPlayer = state.game?.winnerPlayer;
    if (winnerPlayer is Player) {
      return Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Game is Finished!'),
              if (winnerPlayer.id == player!.id)
                const Text('You Win')
              else
                const Text('You Lose'),
              Text('Your score: ${player.board.totalScore}'),
              Text('Opponent score: ${opponentPlayer?.board.totalScore}'),
              ElevatedButton(
                onPressed: () =>
                    context.router.replace(const WaitingRoomsRoute()),
                child: const Text('Go Back Waiting Room'),
              )
            ],
          ),
        ),
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
