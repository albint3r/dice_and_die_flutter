import 'package:dice_and_die_flutter/presentation/game/widgets/podium_area/podium_layou.dart';
import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../../gen/assets.gen.dart';

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
