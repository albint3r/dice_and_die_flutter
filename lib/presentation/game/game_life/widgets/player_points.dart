import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';

class PlayerPoints extends StatelessWidget {
  const PlayerPoints({
    this.player,
    this.align = Alignment.centerLeft,
  });

  final Player? player;
  final AlignmentGeometry align;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: 60,
      child: Align(
        alignment: align,
        child: TitleH1(
          text: '${player?.board.totalScore}',
          fontSize: 40,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }
}
