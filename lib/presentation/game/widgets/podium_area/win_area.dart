import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../../gen/assets.gen.dart';
import 'podium_layou.dart';

class WinArea extends StatelessWidget {
  const WinArea({required this.player, required this.opponentPlayer});

  final Player player;

  final Player? opponentPlayer;

  @override
  Widget build(BuildContext context) {
    return PodiumLayout(
      player: player,
      opponentPlayer: opponentPlayer,
      backGroundImage: Assets.images.backgroundWin.provider(),
      textImage: Assets.images.youWin.image(),
    );
  }
}
