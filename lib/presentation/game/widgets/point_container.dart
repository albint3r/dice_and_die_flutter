import 'package:flutter/material.dart';

import '../../../domain/waiting_room/player.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
import 'board/coin_custom_painter.dart';

class PointContainer extends StatelessWidget {
  const PointContainer(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          width: shortButtonWidth,
          height: 20,
          child: Center(
            child: TitleH2(value),
          ),
        ),
      ],
    );
  }
}
