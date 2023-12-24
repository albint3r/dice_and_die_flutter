import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/game.dart';
import '../../../../domain/waiting_room/game_state.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';
import '../../../core/theme/const_values.dart';

const size = 50.0;

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );

    _controller.repeat();
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Random random = Random();
    if (_isDiceRolling(game)) {
      _startAnimation();
    } else {
      _stopAnimation();
    }

    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: elevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: colorScheme.onPrimary,
          ),
          width: size,
          height: size,
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final int randomValue = random.nextInt(6) + 1;
                return TitleH1(
                  text: _isDiceRolling(game)
                      ? "$randomValue"
                      : "${widget.player?.die.number ?? 0}",
                  color: colorScheme.onBackground,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
