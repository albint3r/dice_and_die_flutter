import 'package:dice_and_die_flutter/presentation/game/widgets/player_board_die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/player.dart';
import 'board.dart';

class PlayerBoard extends StatelessWidget {
  const PlayerBoard({this.player, this.isFirstPerson = false, super.key});

  final Player? player;
  final bool isFirstPerson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: player is Player
          ? [
              // This show the dice above the board only for opponents
              if (!isFirstPerson)
                PlayerBoardDie(
                  die: player?.die,
                  onTap: () => context.read<GameBloc>().add(
                        const GameEvent.rollDice(),
                      ),
                ),
              Board(
                player: player,
                isFirstPerson: isFirstPerson,
              ),
              // This show de dice below the the boar for the player 1
              if (isFirstPerson)
                PlayerBoardDie(
                  die: player?.die,
                  onTap: () => context.read<GameBloc>().add(
                        const GameEvent.rollDice(),
                      ),
                ),
            ]
          : [],
    );
  }
}
