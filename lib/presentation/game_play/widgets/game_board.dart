import 'package:flutter/material.dart';

import '../../../domain/game2/entities/player.dart';
import '../../core/theme/const_values.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    required this.player,
    required this.color,
    super.key,
  });

  final Player player;
  final Color color;

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
        blurRadius: 10,
        spreadRadius: 3,
        offset: const Offset(4, 4),
      ),
      BoxShadow(
        color: colorScheme.onPrimaryContainer,
        blurRadius: 10,
        spreadRadius: 3,
        offset: const Offset(-4, -4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: _getBuildBoxDecoration(
            colorScheme,
          ),
          width: width * 0.80,
          child: Center(child: Text('User: ${player.appUser.name}')),
        ),
      ),
    );
  }
}
