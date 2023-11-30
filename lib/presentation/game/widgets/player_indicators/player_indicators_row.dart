import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import 'board_die.dart';
import 'score_indicator.dart';
import 'turn_indicator.dart';

class PlayerIndicatorsRow extends StatelessWidget {
  const PlayerIndicatorsRow({
    this.player,
    required this.isFirstPerson,
    super.key,
  });

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isFirstPerson ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isFirstPerson
            // This is the order of the element ofr the player 2
            ? [
                BoardDie(
                  player: player,
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
                  player: player,
                  onTap: () => context.read<GameBloc>().add(
                        const GameEvent.rollDice(),
                      ),
                ),
              ],
      ),
    );
  }
}
