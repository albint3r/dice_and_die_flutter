import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../core/theme/const_values.dart';
import 'top_life_indicator_bar/life_percentage_indicator.dart';
import 'top_life_indicator_bar/names_and_levels.dart';
import 'top_life_indicator_bar/player_score_board.dart';

class TopLifeIndicatorBar extends StatelessWidget {
  const TopLifeIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamePlayBloc>().state;
    const width = 360.0;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SizedBox(
        height: 80,
        width: width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerScoreBoard(
                  player: state.player!,
                ),
                PlayerScoreBoard(
                  player: state.opponentPlayer!,
                ),
              ],
            ),
            const LifePercentageIndicator(),
            const NamesAndLevels(),
          ],
        ),
      ),
    );
  }
}
