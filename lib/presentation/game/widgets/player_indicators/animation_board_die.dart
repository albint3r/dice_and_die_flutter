import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/game.dart';
import '../../../../domain/waiting_room/game_state.dart';
import '../../../../domain/waiting_room/player.dart';
import 'board_die.dart';

const size = 60.0;

class AnimationBoardDie extends StatefulWidget {
  const AnimationBoardDie({
    this.player,
    this.onTap,
    super.key,
  });

  final Player? player;
  final void Function()? onTap;

  @override
  State<AnimationBoardDie> createState() => _AnimationBoardDieState();
}

class _AnimationBoardDieState extends State<AnimationBoardDie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 60,
      ),
    );

    _angleAnimation = Tween<double>(end: 0, begin: 360).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.repeat();
  }

  void _stopAnimation() {
    _controller.stop();
  }

  bool _isDiceRolling(Game? game) =>
      widget.player?.id == game?.currentPlayer?.id &&
      game?.state == GameAppState.rollDice;



  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    const originalPosition = 0.0;

    if (_isDiceRolling(game)) {
      _startAnimation();
    } else {
      _stopAnimation();
    }

    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        child: BoardDie(
          player: widget.player,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle:
                _isDiceRolling(game) ? _angleAnimation.value : originalPosition,
            child: child,
          );
        },
      ),
    );
  }
}
