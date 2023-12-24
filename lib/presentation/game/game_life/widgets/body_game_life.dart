import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../application/game_life/game_life_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/theme/const_values.dart';
import 'player_points.dart';
import 'players_names.dart';

class BodyGameLife extends StatelessWidget {
  const BodyGameLife({super.key});

  double _getPlayersPercentage(Player? player, Player? opponentPlayer) {
    final int playerTotal = player?.board.totalScore ?? 0;
    final int opponentTotal = opponentPlayer?.board.totalScore ?? 0;
    // if user don't have point, the score percentage would be 50% percent
    if (playerTotal == 0 && opponentTotal == 0) return .5;
    return playerTotal / (playerTotal + opponentTotal);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameLifeBloc>().state;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            children: [
              PlayerPoints(
                player: player,
              ),
              Expanded(
                child: LinearPercentIndicator(
                  percent: _getPlayersPercentage(
                    player,
                    opponentPlayer,
                  ),
                  lineHeight: 15,
                  barRadius: const Radius.circular(borderRadius),
                  animationDuration: 1,
                  animation: true,
                  animateFromLastPercent: true,
                  backgroundColor: colorScheme.secondaryContainer,
                  progressColor: colorScheme.primaryContainer,
                ),
              ),
              PlayerPoints(
                player: opponentPlayer,
              ),
            ],
          ),
          PlayersNames(
            player: player!,
            opponentPlayer: opponentPlayer!,
          ),
        ],
      ),
    );
  }
}
