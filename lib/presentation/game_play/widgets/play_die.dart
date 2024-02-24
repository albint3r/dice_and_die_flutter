import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../core/design_system/text/titleh1.dart';

class PlayDie extends StatelessWidget {
  const PlayDie({
    required this.number,
    super.key,
  });

  final int? number;

  BoxDecoration _buildBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.onPrimary,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      border: Border.all(
        color: colorScheme.secondary,
      ),
      boxShadow: [
        BoxShadow(
          color: colorScheme.primary,
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(1, 4),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: () => context.read<GamePlayBloc>().add(
            const GamePlayEvent.rollDice(),
          ),
      child: Container(
        decoration: _buildBoxDecoration(colorScheme),
        height: 50,
        width: 50,
        child: Center(
          child: TitleH1(
            text: '${number ?? ''}',
            color: colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
