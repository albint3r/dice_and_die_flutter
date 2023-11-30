import 'package:flutter/material.dart';

import '../../../domain/waiting_room/player.dart';
import 'point_container.dart';

class PointsRow extends StatelessWidget {
  const PointsRow({
    this.player,
    super.key,
  });

  final Player? player;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PointContainer("${player?.board.score1.val}"),
          PointContainer("${player?.board.score2.val}"),
          PointContainer("${player?.board.score3.val}"),
        ],
      ),
    );
  }
}
