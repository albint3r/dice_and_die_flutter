import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../domain/waiting_room/player.dart';
import 'BoardColumn.dart';

class Board extends StatelessWidget {
  const Board({
    this.player,
    super.key,
  });

  final Player? player;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: SizedBox(
        width: size.width,
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoardColumn(
              column: player!.board.col1,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.rollDice(1),
                  ),
            ),
            BoardColumn(
              column: player!.board.col2,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.rollDice(2),
                  ),
            ),
            BoardColumn(
              column: player!.board.col3,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.rollDice(3),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
