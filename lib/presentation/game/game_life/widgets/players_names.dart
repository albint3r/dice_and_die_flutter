import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/text_body.dart';

class PlayersNames extends StatelessWidget {
  const PlayersNames({
    super.key,
    required this.player,
    required this.opponentPlayer,
  });

  final Player player;
  final Player opponentPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBody(
              player.appUser?.name is String && player.appUser!.name.isNotEmpty
                  ? player.appUser!.name
                  : 'You',
            ),
            TextBody('Lvl. ${player.appUser?.userLevel.level}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextBody(
              opponentPlayer.appUser?.name is String &&
                      opponentPlayer.appUser!.name.isNotEmpty
                  ? opponentPlayer.appUser!.name
                  : 'Opponent',
            ),
            TextBody(
              'Lvl. ${opponentPlayer.appUser?.userLevel.level}',
            ),
          ],
        ),
      ],
    );
  }
}
