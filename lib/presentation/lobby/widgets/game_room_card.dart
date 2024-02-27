import 'package:flutter/material.dart';

import '../../../domain/game2/entities/game.dart';
import '../../core/design_system/cards/custom_waiting_room_card.dart';
import '../../core/design_system/cards/custom_waiting_room_label_card.dart';
import '../../core/theme/const_values.dart';
import 'game_room_play_button.dart';
import 'id_label.dart';
import 'names_score.dart';

class GameRoomCard extends StatefulWidget {
  const GameRoomCard({super.key, required this.game});

  final Game game;

  @override
  State<GameRoomCard> createState() => _GameRoomCardState();
}

class _GameRoomCardState extends State<GameRoomCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _curveAnimation =
        CurvedAnimation(parent: _opacityAnimation, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spaceBetweenContainer = 20.0;
    const zeroDistance = 0.0;
    const topPosition = 40.0;
    return FadeTransition(
      opacity: _curveAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: waitingRoomCardWidth + spaceBetweenContainer,
                  height: waitingRoomCardHeight,
                ),
                const Positioned(
                  right: zeroDistance + 15,
                  child: CustomWaitingRoomCard(),
                ),
                Positioned(
                  left: zeroDistance,
                  child: CustomWaitingRoomLabelCard(
                    game: widget.game,
                  ),
                ),
                Positioned(
                  right: zeroDistance,
                  top: waitingRoomCardHeight * .3,
                  child: GameRoomPlayButton(
                    game: widget.game,
                  ),
                ),
                Positioned(
                  top: topPosition,
                  left: waitingRoomCardWidth * .40,
                  child: NamesScore(
                    game: widget.game,
                  ),
                ),
                Positioned(
                  top: 2.5,
                  right: topPosition + 10,
                  child: IdLabel(
                    game: widget.game,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
