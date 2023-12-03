import 'package:flutter/material.dart';

import '../../../../domain/waiting_room/player.dart';
import '../score/points_row.dart';
import 'custom_board.dart';

class BoardWithPointsIndicators extends StatelessWidget {
  const BoardWithPointsIndicators(
      {super.key, this.player, required this.isFirstPerson});

  final Player? player;
  final bool isFirstPerson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFirstPerson)
          PointsRow(
            player: player,
          ),
        CustomBoard(
          player: player,
          isFirstPerson: isFirstPerson,
        ),
        if (!isFirstPerson)
          PointsRow(
            player: player,
          ),
      ],
    );
  }
}
