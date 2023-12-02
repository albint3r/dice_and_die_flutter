import 'package:dice_and_die_flutter/presentation/waiting_rooms/widgets/waiting_room_play_button.dart';
import 'package:flutter/material.dart';

import '../../../domain/waiting_room/game.dart';
import '../../core/design_system/cards/custom_waiting_room_card.dart';
import '../../core/design_system/cards/custom_waiting_room_label_card.dart';
import '../../core/theme/const_values.dart';

class WaitingRoomCard extends StatelessWidget {
  const WaitingRoomCard({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    const spaceBetweenContainer = 20.0;
    const distanceBorder = 0.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            const SizedBox(
              width: waitingRoomCardWidth + spaceBetweenContainer,
              height: waitingRoomCardHeight,
            ),
            const Positioned(
              right: distanceBorder + 15,
              child: CustomWaitingRoomCard(),
            ),
            Positioned(
              left: distanceBorder,
              child: CustomWaitingRoomLabelCard(
                game: game,
              ),
            ),
            const Positioned(
              right: distanceBorder,
              top: waitingRoomCardHeight * .3,
              child: WaitingRoomPlayButton(),
            ),
            Positioned(
              top: 40,
              left: waitingRoomCardWidth * .40,
              child: Column(
                children: [
                  Text(
                    'P1 Score: ${game.p1.board.totalScore}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'P2 Score: ${game.p2?.board.totalScore ?? 0}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 40,
              child: Column(
                children: [
                  Text(
                    "ID: ${game.id.substring(0, 5)}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
