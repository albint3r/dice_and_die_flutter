import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../domain/waiting_room/player.dart';
import 'BoardColumn.dart';

class Board extends StatelessWidget {
  const Board({
    this.player,
    required this.isFirstPerson,
    super.key,
  });

  final Player? player;
  final bool isFirstPerson;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.brown,
      child: SizedBox(
        width: size.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoardColumn(
              column: player!.board.col1,
              isFirstPerson: isFirstPerson,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.selectColumn(1),
                  ),
            ),
            BoardColumn(
              column: player!.board.col2,
              isFirstPerson: isFirstPerson,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.selectColumn(2),
                  ),
            ),
            BoardColumn(
              column: player!.board.col3,
              isFirstPerson: isFirstPerson,
              onLongPress: () => context.read<GameBloc>().add(
                    const GameEvent.selectColumn(3),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
