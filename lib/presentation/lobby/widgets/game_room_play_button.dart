import 'package:flutter/material.dart';

import '../../../domain/game2/entities/game.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';

class GameRoomPlayButton extends StatelessWidget {
  const GameRoomPlayButton({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return CustomShortButton.primary(
      Icons.play_arrow,
      onPressed: game.isFull ? null : () => print('Go to play game'),
    );
  }
}
