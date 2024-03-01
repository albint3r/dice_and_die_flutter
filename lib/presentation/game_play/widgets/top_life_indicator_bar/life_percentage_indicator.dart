import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../application/game_play/game_play_bloc.dart';

class LifePercentageIndicator extends StatelessWidget {
  const LifePercentageIndicator({super.key});

  /// Return a percentage between 0 and 1. In case players start game
  /// and not have points it will return .5 because each player have 50%.
  double _getPercentage(int playerBoardScore, int opponentBoardScore) {
    if (opponentBoardScore == 0 && playerBoardScore == 0) {
      return .5;
    }
    return playerBoardScore / (playerBoardScore + opponentBoardScore);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GamePlayBloc>().state;
    const width = 360.0;
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: _getPercentage(
        state.player?.board.score ?? 0,
        state.opponentPlayer?.board.score ?? 0,
      ),
      // restartAnimation: true,
      barRadius: const Radius.circular(15),
      lineHeight: 15,
      width: width,
      backgroundColor: colorScheme.secondaryContainer,
      progressColor: colorScheme.onSecondary,
    );
  }
}
