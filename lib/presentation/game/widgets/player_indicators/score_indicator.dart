import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../core/design_system/text/titleh2.dart';

class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({
    required this.isOpponent,
    super.key,
  });

  final bool isOpponent;

  factory ScoreIndicator.opponentPlayer() => const ScoreIndicator(
        isOpponent: true,
      );

  factory ScoreIndicator.player() => const ScoreIndicator(
        isOpponent: false,
      );

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isOpponent
          ? TitleH2('Score: ${opponentPlayer?.board.totalScore}')
          : TitleH2('Score: ${player?.board.totalScore}'),
    );
  }
}
