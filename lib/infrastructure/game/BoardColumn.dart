import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../domain/waiting_room/player.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    this.column = const [],
    required this.isFirstPerson,
    this.onLongPress,
    super.key,
  });

  final List<int> column;
  final bool isFirstPerson;
  final void Function()? onLongPress;

  List<Widget> _getColumnsPoints(List<int> column) {
    return [
      for (final points in column)
        Card(
          elevation: 15,
          color: Colors.white,
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                points > 0 ? "$points" : "0",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Card(
        color: Colors.green,
        child: SizedBox(
          height: 300,
          width: 100,
          child: Column(
            mainAxisAlignment: isFirstPerson
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: _getColumnsPoints(column),
          ),
        ),
      ),
    );
  }
}
