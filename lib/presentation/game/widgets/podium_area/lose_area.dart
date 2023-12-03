import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/design_system/buttons/custom_long_button.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/const_values.dart';
import 'game_info_container.dart';

class LoseArea extends StatelessWidget {
  const LoseArea({required this.player, required this.opponentPlayer});

  final Player player;

  final Player? opponentPlayer;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: Assets.images.backgroundLose.provider(),
        ),
      ),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                GameInfoContainer(
                  player: player,
                  opponentPlayer: opponentPlayer,
                ),
                Positioned(
                  left: 25,
                  child: Assets.images.youLose.image(),
                )
              ],
            ),
            const Gap(10),
            CustomLongButton(
              text: 'Go Back Menu',
              width: waitingRoomCardWidth * .80,
              onPressed: () => context.router.replace(
                const WaitingRoomsRoute(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
