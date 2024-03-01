import 'package:flutter/material.dart';

import '../../../domain/game_play/entities/game.dart';
import '../../core/design_system/text/titleh2.dart';

class NamesScore extends StatelessWidget {
  const NamesScore({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleH2('P1 Score: ${game.p1.board.score}'),
        TitleH2('P2 Score: ${game.p2?.board.score ?? 0}'),
      ],
    );
  }
}
