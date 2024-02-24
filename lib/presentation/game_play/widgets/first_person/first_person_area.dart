import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../core/theme/const_values.dart';
import '../game_board.dart';
import '../play_die.dart';
import 'player_column.dart';

class FirstPersonArea extends StatelessWidget {
  const FirstPersonArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightWithoutBottomBar = (size.height - bottomAppBarHeight) / 2;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GamePlayBloc>().state;

    if (state.player is Player) {
      final columns = state.player!.board.columns;
      return SizedBox(
        height: heightWithoutBottomBar,
        width: size.width,
        child: Column(
          children: [
            GameBoard(
              color: colorScheme.onSecondary,
              player: state.player!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PlayerColumn(index: 1, column: columns[1]!),
                  PlayerColumn(index: 2, column: columns[2]!),
                  PlayerColumn(index: 3, column: columns[3]!),
                ],
              ),
            ),
            PlayDie(number: state.player?.die.currentNumber),
            Gap(50),
          ],
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
