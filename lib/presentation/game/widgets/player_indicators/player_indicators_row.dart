import 'package:dice_and_die_flutter/presentation/game/widgets/player_indicators/score_indicator.dart';
import 'package:dice_and_die_flutter/presentation/game/widgets/player_indicators/turn_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import 'board_die.dart';

class PlayerIndicatorsRow extends StatelessWidget {
  const PlayerIndicatorsRow(
      {this.player, required this.isFirstPerson, super.key});

  final Player? player;

  //
  final bool isFirstPerson;

  factory PlayerIndicatorsRow.opponentPlayer(Player? player) {
    return PlayerIndicatorsRow(
      player: player,
      isFirstPerson: false,
    );
  }

  factory PlayerIndicatorsRow.player(Player player) {
    return PlayerIndicatorsRow(
      player: player,
      isFirstPerson: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFirstPerson ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: isFirstPerson
          // This is the order of the element ofr the player 2
          ? [
              BoardDie(
                die: player?.die,
                onTap: () => context.read<GameBloc>().add(
                      const GameEvent.rollDice(),
                    ),
              ),
              TurnIndicator.player(),
              ScoreIndicator.player(),
            ]
          // This is the order of the element ofr the player 1
          : [
              TurnIndicator.opponentPlayer(),
              ScoreIndicator.opponentPlayer(),
              BoardDie(
                die: player?.die,
                onTap: () => context.read<GameBloc>().add(
                      const GameEvent.rollDice(),
                    ),
              ),
            ],
    );
  }
}
