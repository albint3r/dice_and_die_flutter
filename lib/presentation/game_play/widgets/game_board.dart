import 'package:flutter/material.dart';

import '../../core/theme/const_values.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.onSecondary,
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
            ],
          ),
          width: width * 0.80,
        ),
      ),
    );
  }
}
