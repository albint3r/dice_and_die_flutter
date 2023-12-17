import 'package:flutter/material.dart';

import '../../text/titleh1.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key});

  BoxDecoration _boxDecoration(ColorScheme colorScheme) => BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: colorScheme.secondary,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      alignment: Alignment.centerLeft,
      width: 300,
      height: 50,
      decoration: _boxDecoration(colorScheme),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TitleH1(
          fontSize: 40,
          text: 'Menu',
          color: colorScheme.onSecondary,
        ),
      ),
    );
  }
}
