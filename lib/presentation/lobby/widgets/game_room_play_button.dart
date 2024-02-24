import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/game2/entities/game.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';
import '../../core/router/app_router.dart';

class GameRoomPlayButton extends StatelessWidget {
  const GameRoomPlayButton({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return CustomShortButton.primary(
      Icons.play_arrow,
      onPressed: game.isFull
          ? null
          : () => context.router.push(
                JoinGameRoute(
                  game: game,
                ),
              ),
    );
  }
}
