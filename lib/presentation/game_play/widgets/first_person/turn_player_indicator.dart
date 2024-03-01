import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game_play/enums/enum_game_state.dart';
import '../../../core/design_system/text/text_body.dart';

class TurnPlayerIndicator extends StatelessWidget {
  const TurnPlayerIndicator({
    this.isTurn = true,
    this.reverse = false,
  });

  final bool isTurn;
  final bool reverse;

  String _getStateTextIndicator(EnumGameState gameState) {
    if (gameState == EnumGameState.rollDice) {
      return 'Roll Dice';
    }
    if (gameState == EnumGameState.selectColumn) {
      return 'Select Column';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const arrowSize = 40.0;
    final state = context.watch<GamePlayBloc>().state;
    final gameState = state.game?.gameState;
    if (isTurn) {
      return Expanded(
        child: Row(
          mainAxisAlignment:
              reverse ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (reverse)
              Icon(
                Icons.arrow_back_ios_outlined,
                color: colorScheme.primary,
                size: arrowSize,
              ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.primary,
                ),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                foregroundColor: colorScheme.primary,
                child: TextBody(
                  _getStateTextIndicator(gameState!),
                  maxLines: 2,
                  fontSize: 8,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (!reverse)
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: colorScheme.primary,
                size: arrowSize,
              ),
          ],
        ),
      );
    }
    return const Expanded(child: SizedBox());
  }
}
