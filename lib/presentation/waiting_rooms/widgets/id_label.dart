import 'package:flutter/material.dart';

import '../../../domain/game2/entities/game.dart';
import '../../core/design_system/text/text_body_small.dart';

class IdLabel extends StatelessWidget {
  const IdLabel({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return TextBodySmall(
      "ID: ${game.gameId.substring(0, 5)}",
    );
  }
}
