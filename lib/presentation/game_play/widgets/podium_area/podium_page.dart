import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/game2/entities/game.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../../gen/assets.gen.dart';
import 'body_podium_area.dart';

@RoutePage()
class PodiumPage extends StatelessWidget {
  const PodiumPage({
    required this.player,
    required this.opponentPlayer,
    required this.winnerPlayer,
    required this.game,
  });

  final Game game;
  final Player player;
  final Player opponentPlayer;
  final (Player, Player?) winnerPlayer;

  @override
  Widget build(BuildContext context) {
    final isTie = winnerPlayer is (Player, Player);
    final winner = winnerPlayer.$1;
    final isPlayerWinner = winner == player;

    if (isTie) {
      return BodyPodiumArea(
        game: game,
        player: player,
        opponentPlayer: opponentPlayer,
        backGroundImage: Assets.images.backgroundWin.provider(),
        textImage: Assets.images.youWin.image(),
      );
    }
    if (isPlayerWinner) {
      return BodyPodiumArea(
        game: game,
        player: player,
        opponentPlayer: opponentPlayer,
        backGroundImage: Assets.images.backgroundWin.provider(),
        textImage: Assets.images.youWin.image(),
      );
    }
    return BodyPodiumArea(
      game: game,
      player: player,
      opponentPlayer: opponentPlayer,
      backGroundImage: Assets.images.backgroundLose.provider(),
      textImage: Assets.images.youLose.image(),
    );
  }
}
