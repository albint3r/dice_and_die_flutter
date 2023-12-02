import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class CustomWaitingRoomCard extends StatelessWidget {
  const CustomWaitingRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RPSCustomPainter(),
      child: const SizedBox(
        height: waitingRoomCardHeight,
        width: waitingRoomCardWidth,
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.6483597, size.height * 0.1884042);
    path_0.cubicTo(
      size.width * 0.6519571,
      size.height * 0.1403396,
      size.width * 0.6567525,
      size.height * 0.09207635,
      size.width * 0.6664554,
      size.height * 0.05332802,
    );
    path_0.cubicTo(
      size.width * 0.6746997,
      size.height * 0.02038958,
      size.width * 0.6839010,
      0,
      size.width * 0.6955050,
      0,
    );
    path_0.lineTo(size.width * 0.9653531, 0);
    path_0.cubicTo(
      size.width * 0.9831815,
      0,
      size.width * 0.9976370,
      size.height * 0.04310906,
      size.width * 0.9976370,
      size.height * 0.09628667,
    );
    path_0.lineTo(size.width * 0.9976370, size.height * 0.6565000);
    path_0.cubicTo(
      size.width * 0.9976370,
      size.height * 0.7096781,
      size.width * 0.9831815,
      size.height * 0.7527865,
      size.width * 0.9653531,
      size.height * 0.7527865,
    );
    path_0.lineTo(size.width * 0.6456172, size.height * 0.7527865);
    path_0.cubicTo(
      size.width * 0.6352772,
      size.height * 0.7527865,
      size.width * 0.6260726,
      size.height * 0.7382865,
      size.width * 0.6201650,
      size.height * 0.7157313,
    );
    path_0.cubicTo(
      size.width * 0.6115380,
      size.height * 0.6828000,
      size.width * 0.6149076,
      size.height * 0.6354979,
      size.width * 0.6180165,
      size.height * 0.5939146,
    );
    path_0.lineTo(size.width * 0.6483597, size.height * 0.1884042);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.03502508, size.height * 0.3731177);
    path_1.cubicTo(
      size.width * 0.03862145,
      size.height * 0.3250531,
      size.width * 0.04341782,
      size.height * 0.2767896,
      size.width * 0.05311914,
      size.height * 0.2380417,
    );
    path_1.cubicTo(
      size.width * 0.06136601,
      size.height * 0.2051031,
      size.width * 0.07056700,
      size.height * 0.1847135,
      size.width * 0.08216931,
      size.height * 0.1847135,
    );
    path_1.lineTo(size.width * 0.9653531, size.height * 0.1847135);
    path_1.cubicTo(
      size.width * 0.9831815,
      size.height * 0.1847135,
      size.width * 0.9976370,
      size.height * 0.2278219,
      size.width * 0.9976370,
      size.height * 0.2810000,
    );
    path_1.lineTo(size.width * 0.9976370, size.height * 0.8412135);
    path_1.cubicTo(
      size.width * 0.9976370,
      size.height * 0.8943906,
      size.width * 0.9831815,
      size.height * 0.9375000,
      size.width * 0.9653531,
      size.height * 0.9375000,
    );
    path_1.lineTo(size.width * 0.03228076, size.height * 0.9375000);
    path_1.cubicTo(
      size.width * 0.02194089,
      size.height * 0.9375000,
      size.width * 0.01273650,
      size.height * 0.9230000,
      size.width * 0.006828482,
      size.height * 0.9004437,
    );
    path_1.cubicTo(
      size.width * -0.001797132,
      size.height * 0.8675135,
      size.width * 0.001571498,
      size.height * 0.8202115,
      size.width * 0.004682937,
      size.height * 0.7786281,
    );
    path_1.lineTo(size.width * 0.03502508, size.height * 0.3731177);
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
