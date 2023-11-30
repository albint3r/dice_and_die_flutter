import 'package:dice_and_die_flutter/presentation/game/widgets/player_indicators/board_die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/player.dart';
import 'board.dart';
import 'player_indicators/player_indicators_row.dart';
import 'player_indicators/score_indicator.dart';
import 'player_indicators/turn_indicator.dart';

class PlayerGameArea extends StatelessWidget {
  const PlayerGameArea({this.player, this.isFirstPerson = false, super.key});

  final Player? player;
  final bool isFirstPerson;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final currentPlayer = state.game?.currentPlayer;
    return Column(
      children: player is Player
          ? [
              // This show the dice above the board only for opponents
              if (!isFirstPerson) PlayerIndicatorsRow.opponentPlayer(player),
              Board(player: player, isFirstPerson: isFirstPerson),
              // This show de dice below the the boar for the player 1
              if (isFirstPerson && currentPlayer is Player) PlayerIndicatorsRow.player(player!),
            ]
          : [],
    );
  }
}
