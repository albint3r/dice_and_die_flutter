import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import 'board_die.dart';
import 'score_indicator.dart';
import 'turn_indicator.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment:
                isFirstPerson ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: isFirstPerson
                // This is the order of the element ofr the player 2
                ? [
                    ScoreIndicator.player(),
                    BoardDie(
                      player: player,
                      onTap: () => context.read<GameBloc>().add(
                            const GameEvent.rollDice(),
                          ),
                    ),
                    TurnIndicator.player(),
                  ]
                // This is the order of the element ofr the player 1
                : [
                    TurnIndicator.opponentPlayer(),
                    BoardDie(
                      player: player,
                      onTap: () => context.read<GameBloc>().add(
                            const GameEvent.rollDice(),
                          ),
                    ),
                    ScoreIndicator.opponentPlayer(),
                  ],
          ),
        ],
      ),
    );
  }
}
