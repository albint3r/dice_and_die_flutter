import 'package:flutter/material.dart';

import '../../../../domain/game2/entities/game.dart';
import '../../theme/const_values.dart';
import '../text/titleh1.dart';

class CustomWaitingRoomLabelCard extends StatelessWidget {
  const CustomWaitingRoomLabelCard({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomPaint(
      painter: RPSCustomPainter(
        game.isFull
            ? colorScheme.secondaryContainer
            : colorScheme.inversePrimary,
      ),
      child: SizedBox(
        height: waitingRoomLabelCardHeight,
        width: waitingRoomLabelCardWidth,
        child: Center(
          child: TitleH1(
            text: game.isFull ? 'Full' : 'Join\nGame',
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  const RPSCustomPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.1366151, size.height * 0.2693785);
    path_0.cubicTo(
      size.width * 0.1541651,
      size.height * 0.1924615,
      size.width * 0.1763221,
      size.height * 0.1144058,
      size.width * 0.2205012,
      size.height * 0.05928108,
    );
    path_0.cubicTo(
      size.width * 0.2500802,
      size.height * 0.02237277,
      size.width * 0.2831233,
      0,
      size.width * 0.3238430,
      0,
    );
    path_0.lineTo(size.width * 0.8682116, 0);
    path_0.cubicTo(
      size.width * 0.9369000,
      0,
      size.width * 0.9925837,
      size.height * 0.05700569,
      size.width * 0.9925837,
      size.height * 0.1273258,
    );
    path_0.lineTo(size.width * 0.9925837, size.height * 0.8681308);
    path_0.cubicTo(
      size.width * 0.9925837,
      size.height * 0.9384508,
      size.width * 0.9369000,
      size.height * 0.9954554,
      size.width * 0.8682116,
      size.height * 0.9954554,
    );
    path_0.lineTo(size.width * 0.1243709, size.height * 0.9954554);
    path_0.cubicTo(
      size.width * 0.09440570,
      size.height * 0.9954554,
      size.width * 0.06691547,
      size.height * 0.9846077,
      size.width * 0.04544360,
      size.height * 0.9665369,
    );
    path_0.cubicTo(
      size.width * -0.005465244,
      size.height * 0.9236908,
      size.width * 0.008860244,
      size.height * 0.8292985,
      size.width * 0.02629721,
      size.height * 0.7528754,
    );
    path_0.lineTo(size.width * 0.1366151, size.height * 0.2693785);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
