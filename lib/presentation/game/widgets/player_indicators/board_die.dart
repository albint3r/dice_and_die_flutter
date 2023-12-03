import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';
import '../../../core/theme/const_values.dart';

class BoardDie extends StatelessWidget {
  const BoardDie({super.key, this.player});

  final Player? player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const size = 60.0;
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: colorScheme.onPrimary,
        ),
        width: size,
        height: size,
        child: Center(
          child: TitleH1(
            text: "${player?.die.number ?? 0}",
            color: colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
