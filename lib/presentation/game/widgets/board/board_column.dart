import '../../../../domain/waiting_room/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/game_state.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/theme/const_values.dart';

const dieSize = 35.0;

class BoardColumn extends StatefulWidget {
  const BoardColumn({
    this.column = const [],
    this.player,
    required this.isFirstPerson,
    this.onLongPress,
    super.key,
  });

  final List<int> column;
  final Player? player;
  final bool isFirstPerson;
  final void Function()? onLongPress;

  @override
  State<BoardColumn> createState() => _BoardColumnState();
}

class _BoardColumnState extends State<BoardColumn>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _paddingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _paddingAnimation = Tween<double>(
      end: columnWithMax,
      begin: columnWithMin,
    ).animate(_controller);

    _controller.repeat(
      reverse: true,
    );
  }

  List<Widget> _getColumnsPoints(
    List<int> column,
    ColorScheme colorScheme,
  ) {
    const boxSize = 50.0;
    return [
      for (final points in column)
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: Center(
            child: Text(
              points > 0 ? "$points" : "0",
              style: TextStyle(
                fontSize: diceNumberFontSize,
                color: colorScheme.onBackground,
              ),
            ),
          ),
        )
    ];
  }

  bool _isSelectColumn(Game? game) {
    return game?.currentPlayer?.id == widget.player?.id &&
        game?.state == GameAppState.selectColumn;
        // widget.column.length < 3;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    return Flexible(
      child: InkWell(
        onLongPress: widget.onLongPress,
        child: AnimatedBuilder(
          animation: _paddingAnimation,
          builder: (_, __) {
            return Padding(
              padding: const EdgeInsets.only(
                top: padding,
                bottom: padding + 7,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                // I use the width of the column and the row space around
                // to create the padding effect
                width: _isSelectColumn(game)
                    ? _paddingAnimation.value
                    : columnWithMax,
                height: 150,
                child: Column(
                  mainAxisAlignment: widget.isFirstPerson
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: _getColumnsPoints(
                    widget.column,
                    colorScheme,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
