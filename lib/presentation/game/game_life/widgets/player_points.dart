import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';

class PlayerPoints extends StatelessWidget {
  const PlayerPoints({this.player});

  final Player? player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: 60,
      child: Center(
        child: TitleH1(
          text: '${player?.board.totalScore}',
          fontSize: 40,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }
}
