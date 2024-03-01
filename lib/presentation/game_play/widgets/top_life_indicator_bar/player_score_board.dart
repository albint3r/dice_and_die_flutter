import 'package:flutter/material.dart';

import '../../../../domain/game_play/entities/player.dart';
import '../../../core/design_system/text/titleh1.dart';

class PlayerScoreBoard extends StatelessWidget {
  const PlayerScoreBoard({required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TitleH1(
      text: '${player.board.score}',
      color: colorScheme.onBackground,
      fontSize: 25,
    );
  }
}
