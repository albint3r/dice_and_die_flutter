import 'package:flutter/material.dart';

import '../../../domain/waiting_room/game.dart';
import '../../core/design_system/text/text_body_small.dart';

class IdLabel extends StatelessWidget {
  const IdLabel({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return TextBodySmall(
      "ID: ${game.id.substring(0, 5)}",
    );
  }
}
