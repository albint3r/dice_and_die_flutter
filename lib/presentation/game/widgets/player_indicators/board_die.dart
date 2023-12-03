import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/game.dart';
import '../../../../domain/waiting_room/game_state.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';
import '../../../core/theme/const_values.dart';

const size = 60.0;

class BoardDie extends StatefulWidget {
  const BoardDie({
    this.player,
    this.onTap,
    super.key,
  });

  final Player? player;
  final void Function()? onTap;

  @override
  State<BoardDie> createState() => _BoardDieState();
}

class _BoardDieState extends State<BoardDie>
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

    _angleAnimation = Tween<double>(end: 0, begin: 360).animate(
      _controller,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isDiceRolling(Game? game) =>
      widget.player?.id == game?.currentPlayer?.id &&
      game?.state == GameAppState.rollDice;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const originalPosition = 0.0;
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle:
                _isDiceRolling(game) ? _angleAnimation.value : originalPosition,
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ), // Ajusta el valor según tu preferencia
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
                  child: TitleH1(
                    text: "${widget.player?.die.number ?? 0}",
                    color: colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
