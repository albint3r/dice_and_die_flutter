import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import 'board_with_points_indicators.dart';
import '../player_indicators/player_indicators_column.dart';

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
              if (!isFirstPerson) PlayerIndicatorsColumn.opponentPlayer(player),
              BoardWithPointsIndicators(
                player: player,
                isFirstPerson: isFirstPerson,
              ),
              // This show de dice below the the boar for the player 1
              if (isFirstPerson && currentPlayer is Player)
                PlayerIndicatorsColumn.player(player!),
            ]
          : [],
    );
  }
}
