import 'package:flutter/material.dart';

import '../../../../domain/game2/entities/player.dart';
import '../../../core/design_system/text/titleh2.dart';
import '../../../core/theme/const_values.dart';

class GameStatsInfoContainer extends StatelessWidget {
  const GameStatsInfoContainer({
    required this.player,
    required this.opponentPlayer,
  });

  final Player player;

  final Player opponentPlayer;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const heightCard = 165.0;
    return CustomPaint(
      painter: RPSCustomPainter(
        colorScheme,
      ),
      child: SizedBox(
        width: waitingRoomCardWidth,
        height: heightCard,
        child: Padding(
          padding: const EdgeInsets.only(
            left: waitingRoomCardWidth * .20,
            top: waitingRoomCardWidth * .10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleH2('Your Score: ${player.board.score}'),
              TitleH2('Opponent Score: ${opponentPlayer.board.score}'),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  const RPSCustomPainter(
    this.colorScheme,
  );

  final ColorScheme colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.8220413, size.height * 0.7678471);
    path_0.cubicTo(
      size.width * 0.8119778,
      size.height * 0.8156412,
      size.width * 0.8007206,
      size.height * 0.8503647,
      size.width * 0.7815397,
      size.height * 0.8540941,
    );
    path_0.lineTo(size.width * 0.1655787, size.height * 0.8686765);
    path_0.cubicTo(
      size.width * 0.1581489,
      size.height * 0.8701176,
      size.width * 0.1510194,
      size.height * 0.8671353,
      size.width * 0.1449549,
      size.height * 0.8608706,
    );
    path_0.cubicTo(
      size.width * 0.1256530,
      size.height * 0.8409294,
      size.width * 0.1217784,
      size.height * 0.7925529,
      size.width * 0.1112359,
      size.height * 0.7565647,
    );
    path_0.lineTo(size.width * 0.02842248, size.height * 0.4738718);
    path_0.cubicTo(
      size.width * 0.01788000,
      size.height * 0.4378835,
      size.width * 0.007591460,
      size.height * 0.3907518,
      size.width * 0.02423921,
      size.height * 0.3638224,
    );
    path_0.cubicTo(
      size.width * 0.02946956,
      size.height * 0.3553618,
      size.width * 0.03610984,
      size.height * 0.3497000,
      size.width * 0.04353968,
      size.height * 0.3482553,
    );
    path_0.lineTo(size.width * 0.9193778, size.height * 0.02068959);
    path_0.cubicTo(
      size.width * 0.9248857,
      size.height * 0.01961906,
      size.width * 0.9302254,
      size.height * 0.02098100,
      size.width * 0.9350921,
      size.height * 0.02430765,
    );
    path_0.cubicTo(
      size.width * 0.9590952,
      size.height * 0.04072141,
      size.width * 0.9531968,
      size.height * 0.1014400,
      size.width * 0.9444317,
      size.height * 0.1459800,
    );
    path_0.lineTo(size.width * 0.8220413, size.height * 0.7678471);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = colorScheme.onBackground;
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.8264762, size.height * 0.7710529);
    path_1.lineTo(size.width * 0.8264952, size.height * 0.7709647);
    path_1.lineTo(size.width * 0.8265143, size.height * 0.7708706);
    path_1.lineTo(size.width * 0.9489048, size.height * 0.1490029);
    path_1.cubicTo(
      size.width * 0.9533619,
      size.height * 0.1263512,
      size.width * 0.9572698,
      size.height * 0.09877353,
      size.width * 0.9568095,
      size.height * 0.07428824,
    );
    path_1.cubicTo(
      size.width * 0.9563397,
      size.height * 0.04953176,
      size.width * 0.9512571,
      size.height * 0.02595653,
      size.width * 0.9367397,
      size.height * 0.01602982,
    );
    path_1.cubicTo(
      size.width * 0.9312032,
      size.height * 0.01224506,
      size.width * 0.9251302,
      size.height * 0.01069941,
      size.width * 0.9188825,
      size.height * 0.01191424,
    );
    path_1.lineTo(size.width * 0.9186571, size.height * 0.01195782);
    path_1.lineTo(size.width * 0.9184349, size.height * 0.01204053);
    path_1.lineTo(size.width * 0.04281143, size.height * 0.3395265);
    path_1.cubicTo(
      size.width * 0.03446794,
      size.height * 0.3412388,
      size.width * 0.02699838,
      size.height * 0.3476465,
      size.width * 0.02110756,
      size.height * 0.3571753,
    );
    path_1.cubicTo(
      size.width * 0.01107473,
      size.height * 0.3734041,
      size.width * 0.009473302,
      size.height * 0.3955682,
      size.width * 0.01144044,
      size.height * 0.4169335,
    );
    path_1.cubicTo(
      size.width * 0.01338708,
      size.height * 0.4380771,
      size.width * 0.01891524,
      size.height * 0.4599135,
      size.width * 0.02423740,
      size.height * 0.4780812,
    );
    path_1.lineTo(size.width * 0.1070508, size.height * 0.7607765);
    path_1.cubicTo(
      size.width * 0.1095460,
      size.height * 0.7692941,
      size.width * 0.1116797,
      size.height * 0.7786588,
      size.width * 0.1138190,
      size.height * 0.7885294,
    );
    path_1.cubicTo(
      size.width * 0.1142540,
      size.height * 0.7905353,
      size.width * 0.1146902,
      size.height * 0.7925706,
      size.width * 0.1151302,
      size.height * 0.7946176,
    );
    path_1.cubicTo(
      size.width * 0.1168219,
      size.height * 0.8025000,
      size.width * 0.1185660,
      size.height * 0.8106294,
      size.width * 0.1204784,
      size.height * 0.8184000,
    );
    path_1.cubicTo(
      size.width * 0.1252975,
      size.height * 0.8379706,
      size.width * 0.1316251,
      size.height * 0.8572000,
      size.width * 0.1426362,
      size.height * 0.8685765,
    );
    path_1.cubicTo(
      size.width * 0.1494679,
      size.height * 0.8756353,
      size.width * 0.1574952,
      size.height * 0.8790294,
      size.width * 0.1658514,
      size.height * 0.8774941,
    );
    path_1.lineTo(size.width * 0.7816000, size.height * 0.8629176);
    path_1.lineTo(size.width * 0.7818190, size.height * 0.8629118);
    path_1.lineTo(size.width * 0.7820349, size.height * 0.8628706);
    path_1.cubicTo(
      size.width * 0.7932571,
      size.height * 0.8606882,
      size.width * 0.8019302,
      size.height * 0.8493588,
      size.width * 0.8089397,
      size.height * 0.8329765,
    );
    path_1.cubicTo(
      size.width * 0.8158667,
      size.height * 0.8167882,
      size.width * 0.8214032,
      size.height * 0.7951529,
      size.width * 0.8264762,
      size.height * 0.7710529,
    );
    path_1.close();

    final Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.009523810;
    paint1Stroke.color = const Color(0xff515795).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Stroke);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = colorScheme.surface;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
