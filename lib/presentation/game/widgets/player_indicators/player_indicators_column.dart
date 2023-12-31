import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import 'animation_board_die.dart';

class PlayerIndicatorsColumn extends StatelessWidget {
  const PlayerIndicatorsColumn({
    this.player,
    required this.isFirstPerson,
    super.key,
  });

  final Player? player;

  //
  final bool isFirstPerson;

  factory PlayerIndicatorsColumn.opponentPlayer(Player? player) {
    return PlayerIndicatorsColumn(
      player: player,
      isFirstPerson: false,
    );
  }

  factory PlayerIndicatorsColumn.player(Player player) {
    return PlayerIndicatorsColumn(
      player: player,
      isFirstPerson: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment:
              isFirstPerson ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: isFirstPerson
              // This is the order of the element ofr the player 2
              ? [
                  AnimationBoardDie(
                    player: player,
                    onTap: () => context.read<GameBloc>().add(
                          const GameEvent.rollDice(),
                        ),
                  ),
                ]
              // This is the order of the element ofr the player 1
              : [
                  AnimationBoardDie(
                    player: player,
                    onTap: () => context.read<GameBloc>().add(
                          const GameEvent.rollDice(),
                        ),
                  ),
                  const Gap(5),
                ],
        ),
      ],
    );
  }
}
