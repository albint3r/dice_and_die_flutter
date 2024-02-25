import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';

class TopLifeIndicatorBar extends StatelessWidget {
  const TopLifeIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GamePlayBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        width: 380,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleH1(
                  text: '${state.player?.board.score}',
                  color: colorScheme.secondary,
                ),
                TitleH1(
                  text: '${state.opponentPlayer?.board.score}',
                  color: colorScheme.secondary,
                ),
              ],
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: .6,
              barRadius: const Radius.circular(15),
              lineHeight: 15,
              width: 380,
              backgroundColor: colorScheme.secondaryContainer,
              progressColor: colorScheme.onSecondary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBody('${state.player?.appUser.name}'),
                TextBody('${state.opponentPlayer?.appUser.name}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
