import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/game_state.dart';
import '../../../../domain/waiting_room/player.dart';

const size = 60.0;

class BoardDie extends StatelessWidget {
  const BoardDie({
    this.player,
    this.onTap,
    super.key,
  });

  final Player? player;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          transform: player?.id == game?.currentPlayer?.id &&
                  game!.state == GameAppState.rollDice
              ? Matrix4.rotationZ(0.1) // Cambia el ángulo según tus necesidades
              : Matrix4.rotationZ(0),
          width: size,
          height: size,
          color: Colors.white,
          child: Center(
            child: Text(
              "${player?.die.number ?? 0}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
