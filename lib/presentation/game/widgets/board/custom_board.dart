import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/theme/const_values.dart';
import 'animated_board_column.dart';

class CustomBoard extends StatelessWidget {
  const CustomBoard({
    this.player,
    required this.isFirstPerson,
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
    final colorScheme = Theme.of(context).colorScheme;
    return CustomPaint(
      painter: RPSCustomPainter(
        isFirstPerson,
        colorScheme: colorScheme,
      ),
      child: SizedBox(
        width: waitingRoomCardWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: columnPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedBoardColumn(
                column: getColumnNumberViewOrder(player!.board.col1),
                player: player,
                isFirstPerson: isFirstPerson,
                onTap: () => context.read<GameBloc>().add(
                      const GameEvent.selectColumn(1),
                    ),
              ),
              AnimatedBoardColumn(
                column: getColumnNumberViewOrder(player!.board.col2),
                player: player,
                isFirstPerson: isFirstPerson,
                onTap: () => context.read<GameBloc>().add(
                      const GameEvent.selectColumn(2),
                    ),
              ),
              AnimatedBoardColumn(
                column: getColumnNumberViewOrder(player!.board.col3),
                player: player,
                isFirstPerson: isFirstPerson,
                onTap: () => context.read<GameBloc>().add(
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

class RPSCustomPainter extends CustomPainter {
  const RPSCustomPainter(
    this.isFirstPerson, {
    required this.colorScheme,
  });

  final bool isFirstPerson;
  final ColorScheme colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.003630518, size.height * 0.8420440);
    path_0.lineTo(size.width * 0.02707890, size.height * 0.1061943);
    path_0.cubicTo(
        size.width * 0.02886991,
        size.height * 0.04998887,
        size.width * 0.05149177,
        size.height * 0.006289308,
        size.width * 0.07879665,
        size.height * 0.006289308);
    path_0.lineTo(size.width * 0.9176433, size.height * 0.006289308);
    path_0.cubicTo(
        size.width * 0.9447774,
        size.height * 0.006289308,
        size.width * 0.9673171,
        size.height * 0.04945893,
        size.width * 0.9693293,
        size.height * 0.1052780);
    path_0.lineTo(size.width * 0.9958598, size.height * 0.8411258);
    path_0.cubicTo(
        size.width * 0.9980945,
        size.height * 0.9031321,
        size.width * 0.9743110,
        size.height * 0.9559748,
        size.width * 0.9441738,
        size.height * 0.9559748);
    path_0.lineTo(size.width * 0.05534817, size.height * 0.9559748);
    path_0.cubicTo(
        size.width * 0.02538579,
        size.height * 0.9559748,
        size.width * 0.001665165,
        size.height * 0.9037170,
        size.width * 0.003630518,
        size.height * 0.8420440);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff188CF8).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.003630518, size.height * 0.8420440);
    path_1.lineTo(size.width * 0.02707890, size.height * 0.1061943);
    path_1.cubicTo(
        size.width * 0.02886991,
        size.height * 0.04998887,
        size.width * 0.05149177,
        size.height * 0.006289308,
        size.width * 0.07879665,
        size.height * 0.006289308);
    path_1.lineTo(size.width * 0.9176433, size.height * 0.006289308);
    path_1.cubicTo(
        size.width * 0.9447774,
        size.height * 0.006289308,
        size.width * 0.9673171,
        size.height * 0.04945893,
        size.width * 0.9693293,
        size.height * 0.1052780);
    path_1.lineTo(size.width * 0.9958598, size.height * 0.8411258);
    path_1.cubicTo(
        size.width * 0.9980945,
        size.height * 0.9031321,
        size.width * 0.9743110,
        size.height * 0.9559748,
        size.width * 0.9441738,
        size.height * 0.9559748);
    path_1.lineTo(size.width * 0.05534817, size.height * 0.9559748);
    path_1.cubicTo(
        size.width * 0.02538579,
        size.height * 0.9559748,
        size.width * 0.001665165,
        size.height * 0.9037170,
        size.width * 0.003630518,
        size.height * 0.8420440);
    path_1.close();

    final Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.006097561;
    paint1Stroke.color = Colors.black.withOpacity(1.0);
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = isFirstPerson
        ? colorScheme.primaryContainer
        : colorScheme.secondaryContainer;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
