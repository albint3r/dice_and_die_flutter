import 'package:flutter/material.dart';

import '../buttons/custom_short_buttom.dart';

abstract class AppBarSize {
  static double get topContainerPositionPer => 95;

  static double get bottomContainerPositionPer => 150;

  static double get iconPositionPer => 35;

  static double get titlePositionPer => 95;
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    required this.icon,
    this.onPress,
    this.isRedColor = true,
    super.key,
  });

  final String title;
  final IconData icon;
  final bool isRedColor;
  final void Function()? onPress;

  BoxDecoration _boxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: colorScheme.onBackground,
        ),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colorScheme.primary,
          colorScheme.onSecondary,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Stack(
      children: [
        Container(
          height: AppBarSize.bottomContainerPositionPer,
          // color: Colors.red,
          decoration: _boxDecoration(colorScheme),
        ),
        CustomPaint(
          size: Size(
            width,
            AppBarSize.topContainerPositionPer,
          ),
          painter: CustomAppBarPainter(colorScheme),
        ),
        Positioned(
          right: AppBarSize.iconPositionPer,
          top: 40,
          child: CustomShortButton(
            icon: icon,
            onPressed: onPress,
          ),
        ),
        Positioned(
          // top: titlePositionPer,
          top: AppBarSize.titlePositionPer,
          left: 0,
          right: 0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(500, 200);
}

//Copy this CustomPainter code to the Bottom of the File
class CustomAppBarPainter extends CustomPainter {

  const CustomAppBarPainter(this.colorScheme);

  final ColorScheme colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.0008519455, size.height * -0.2254029);
    path_0.lineTo(size.width * 0.0008519455, size.height * 0.5894411);
    path_0.lineTo(size.width * 0.1854566, size.height * 0.5894411);
    path_0.arcToPoint(
      Offset(size.width * 0.2219488, size.height * 0.6530298),
      radius:
          Radius.elliptical(size.width * 0.08128582, size.height * 0.5973928),
    );
    path_0.lineTo(size.width * 0.2297084, size.height * 0.6816810);
    path_0.arcToPoint(
      Offset(size.width * 0.2470881, size.height * 0.7119852),
      radius:
          Radius.elliptical(size.width * 0.03872433, size.height * 0.2845962),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.7512012, size.height * 0.7119852);
    path_0.arcToPoint(
      Offset(size.width * 0.7685809, size.height * 0.6816810),
      radius:
          Radius.elliptical(size.width * 0.03871922, size.height * 0.2845586),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.7763405, size.height * 0.6530298);
    path_0.arcToPoint(
      Offset(size.width * 0.8128327, size.height * 0.5894411),
      radius:
          Radius.elliptical(size.width * 0.08128582, size.height * 0.5973928),
    );
    path_0.lineTo(size.width * 0.9974442, size.height * 0.5894411);
    path_0.lineTo(size.width * 0.9974442, size.height * -0.2254029);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff2d2d2d).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.0008519455, size.height * -0.2254029);
    path_1.lineTo(size.width * 0.0008519455, size.height * 0.5894411);
    path_1.lineTo(size.width * 0.1854566, size.height * 0.5894411);
    path_1.arcToPoint(
      Offset(size.width * 0.2219488, size.height * 0.6530298),
      radius:
          Radius.elliptical(size.width * 0.08128582, size.height * 0.5973928),
    );
    path_1.lineTo(size.width * 0.2297084, size.height * 0.6816810);
    path_1.arcToPoint(
      Offset(size.width * 0.2470881, size.height * 0.7119852),
      radius:
          Radius.elliptical(size.width * 0.03872433, size.height * 0.2845962),
      clockwise: false,
    );
    path_1.lineTo(size.width * 0.7512012, size.height * 0.7119852);
    path_1.arcToPoint(
      Offset(size.width * 0.7685809, size.height * 0.6816810),
      radius:
          Radius.elliptical(size.width * 0.03871922, size.height * 0.2845586),
      clockwise: false,
    );
    path_1.lineTo(size.width * 0.7763405, size.height * 0.6530298);
    path_1.arcToPoint(
      Offset(size.width * 0.8128327, size.height * 0.5894411),
      radius:
          Radius.elliptical(size.width * 0.08128582, size.height * 0.5973928),
    );
    path_1.lineTo(size.width * 0.9974442, size.height * 0.5894411);
    path_1.lineTo(size.width * 0.9974442, size.height * -0.2254029);
    path_1.close();

    final Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.003407782;
    paint1Stroke.color = colorScheme.onPrimary;
    canvas.drawPath(path_1, paint1Stroke);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = colorScheme.onSecondary;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
