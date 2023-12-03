import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/design_system/text/titleh2.dart';
import '../../../core/theme/const_values.dart';

class PointContainer extends StatelessWidget {
  const PointContainer(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 85,
        ),
        Positioned(
          top: 10,
          right: 0,
          child: Container(
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
        ),
        Assets.images.monetface.image(),
      ],
    );
  }
}
