import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';

class TurnIndicator extends StatelessWidget {
  const TurnIndicator({
    required this.isOpponent,
    super.key,
  });

  final bool isOpponent;

  factory TurnIndicator.opponentPlayer() {
    return const TurnIndicator(
      isOpponent: true,
    );
  }

  factory TurnIndicator.player() {
    return const TurnIndicator(
      isOpponent: false,
    );
  }

  Widget showIndicator(Widget child, bool show) {
    if (!show) return const SizedBox.shrink();
    return child;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final bool show;
    if (isOpponent) {
      show = state.game!.currentPlayer!.id == state.opponentPlayer!.id;
    } else {
      show = state.game!.currentPlayer!.id == state.player!.id;
    }

    return isOpponent
        ? showIndicator(const Text('Opponent Turn ---------->'), show)
        : showIndicator(const Text('<----------- Your turn'), show);
  }
}
