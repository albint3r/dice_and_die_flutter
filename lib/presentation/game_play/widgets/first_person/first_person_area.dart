import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../core/theme/const_values.dart';
import '../game_board.dart';

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
      return Container(
        height: heightWithoutBottomBar,
        width: size.width,
        child: Column(
          children: [
            GameBoard(
              color: colorScheme.onSecondary,
              player: state.player!,
            ),
            Container(
              color: Colors.greenAccent,
              height: 50,
              width: 50,
            )
          ],
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
