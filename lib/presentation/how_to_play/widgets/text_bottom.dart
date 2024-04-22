import 'package:flutter/material.dart';

import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class TextBottom extends StatelessWidget {
  const TextBottom({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: width + padding * 2,
        left: padding,
        right: padding,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: TitleH2(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
