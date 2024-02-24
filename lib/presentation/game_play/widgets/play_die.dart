import 'package:flutter/material.dart';

import '../../core/design_system/text/titleh1.dart';

class PlayDie extends StatelessWidget {
  const PlayDie({super.key});

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
    return Container(
      decoration: _buildBoxDecoration(colorScheme),
      height: 50,
      width: 50,
      child: Center(
        child: TitleH1(
          text: '5',
          color: colorScheme.secondary,
        ),
      ),
    );
  }
}
