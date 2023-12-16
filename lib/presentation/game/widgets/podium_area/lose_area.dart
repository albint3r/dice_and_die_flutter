import 'package:dice_and_die_flutter/presentation/game/widgets/podium_area/podium_layou.dart';
import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../../gen/assets.gen.dart';

class LoseArea extends StatelessWidget {
  const LoseArea({required this.player, required this.opponentPlayer});

  final Player player;

  final Player? opponentPlayer;

  @override
  Widget build(BuildContext context) {
    return PodiumLayout(
      player: player,
      opponentPlayer: opponentPlayer,
      backGroundImage: Assets.images.backgroundLose.provider(),
      textImage: Assets.images.youLose.image(),
    );
  }
}
