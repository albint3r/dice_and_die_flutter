import 'package:dice_and_die_flutter/presentation/game_play/widgets/second_person/opponent_columns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../core/theme/const_values.dart';
import '../game_board.dart';
import '../play_die.dart';

class SecondPersonArea extends StatelessWidget {
  const SecondPersonArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightWithoutBottomBar =
        (size.height - (bottomAppBarHeight + 20)) / 2;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GamePlayBloc>().state;
    if (state.opponentPlayer is Player) {
      return Container(
        height: heightWithoutBottomBar,
        width: size.width,
        color: colorScheme.secondaryContainer.withOpacity(
          .2,
        ),
        child: Column(
          children: [
            Gap(50),
            PlayDie(
              number: state.opponentPlayer?.die.currentNumber,
            ),
            GameBoard(
              color: colorScheme.secondaryContainer,
              player: state.opponentPlayer!,
              child: const Row(
                children: [
                  OpponentColumns(),
                  OpponentColumns(),
                  OpponentColumns(),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
