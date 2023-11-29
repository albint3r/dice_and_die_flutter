import 'package:dice_and_die_flutter/presentation/game/widgets/board_die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/player.dart';
import 'board.dart';
import 'points_row.dart';
import 'score_indicator.dart';
import 'turn_indicator.dart';

class PlayerGameArea extends StatelessWidget {
  const PlayerGameArea({this.player, this.isFirstPerson = false, super.key});

  final Player? player;
  final bool isFirstPerson;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;

    return Column(
      children: player is Player
          ? [
              // This show the dice above the board only for opponents
              if (!isFirstPerson)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // if (state.game!.currentPlayer!.id != state.player!.id)
                    TurnIndicator.opponentPlayer(),
                    ScoreIndicator.opponentPlayer(),
                    BoardDie(
                      die: player?.die,
                      onTap: () => context.read<GameBloc>().add(
                            const GameEvent.rollDice(),
                          ),
                    ),
                  ],
                ),
              Board(
                player: player,
                isFirstPerson: isFirstPerson,
              ),
              // This show de dice below the the boar for the player 1
              if (isFirstPerson)
                Row(
                  children: [
                    BoardDie(
                      die: player?.die,
                      onTap: () => context.read<GameBloc>().add(
                            const GameEvent.rollDice(),
                          ),
                    ),
                    ScoreIndicator.player(),
                    TurnIndicator.player(),
                  ],
                ),
            ]
          : [],
    );
  }
}
