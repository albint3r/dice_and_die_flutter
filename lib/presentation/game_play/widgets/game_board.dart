import 'package:flutter/material.dart';

import '../../../domain/game_play/entities/player.dart';
import '../../core/theme/const_values.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    required this.player,
    required this.color,
    this.child,
    super.key,
  });

  final Player player;
  final Color color;
  final Widget? child;

  BoxDecoration _getBuildBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      boxShadow: _getBoxShadow(colorScheme),
    );
  }

  List<BoxShadow> _getBoxShadow(ColorScheme colorScheme) {
    return [
      BoxShadow(
        color: color,
        blurRadius: blurRadiusBoard,
        spreadRadius: spreadRadius,
        offset: const Offset(4, 4),
      ),
      BoxShadow(
        color: colorScheme.onPrimaryContainer,
        blurRadius: blurRadiusBoard,
        spreadRadius: spreadRadius,
        offset: const Offset(-4, -4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: maxWidthBoard,
            minWidth: minWidthBoard,
          ),
          decoration: _getBuildBoxDecoration(
            colorScheme,
          ),
          child: child,
        ),
      ),
    );
  }
}
