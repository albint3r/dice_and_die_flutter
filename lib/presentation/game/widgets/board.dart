import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';
import '../../../domain/waiting_room/player.dart';
import 'board_column.dart';

class Board extends StatelessWidget {
  const Board({
    this.player,
    required this.isFirstPerson,
    super.key,
  });

  final Player? player;
  final bool isFirstPerson;

  List<int> getColumnNumberViewOrder(List<int> column) {
    if (isFirstPerson) {
      return column;
    }
    return column.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.brown,
        child: SizedBox(
          width: size.width,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BoardColumn(
                column: getColumnNumberViewOrder(player!.board.col1),
                isFirstPerson: isFirstPerson,
                onLongPress: () => context.read<GameBloc>().add(
                      const GameEvent.selectColumn(1),
                    ),
              ),
              BoardColumn(
                column: getColumnNumberViewOrder(player!.board.col2),
                isFirstPerson: isFirstPerson,
                onLongPress: () => context.read<GameBloc>().add(
                      const GameEvent.selectColumn(2),
                    ),
              ),
              BoardColumn(
                column: getColumnNumberViewOrder(player!.board.col3),
                isFirstPerson: isFirstPerson,
                onLongPress: () => context.read<GameBloc>().add(
                      const GameEvent.selectColumn(3),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
