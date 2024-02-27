import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/game_state.dart';
import '../../../domain/waiting_room/player.dart';
import '../game_life/widgets/body_game_life.dart';
import '../game_notifications/widgets/body_game_notifications.dart';
import 'board/player_game_area.dart';
import 'podium_area/podium_area.dart';
import '../../game_play/widgets/waiting_game_room.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;

    if (state.isLoading || game == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // This is the waiting area until a player join to the game
    if (state.game?.state == GameAppState.waitingPlayers) {
      return const WaitingGameRoom();
    }
    final winnerPlayer = state.game?.winnerPlayer;
    // If exist a winner show the Podium Area
    if (winnerPlayer is Player) {
      return PodiumArea(winnerPlayer: winnerPlayer);
    }

    return Column(
      children: [
        const BodyGameLife(),
        Expanded(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerGameArea(
                    player: opponentPlayer,
                  ),
                  PlayerGameArea(
                    player: player,
                    isFirstPerson: true,
                  ),
                ],
              ),
              const BodyGameNotifications(),
            ],
          ),
        ),
      ],
    );
  }
}
