import 'package:flutter/material.dart';

import '../../../core/design_system/text/titleh1.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: TitleH1(
        text: 'Dice And DIe',
        fontSize: 50,
        color: colorScheme.onSecondary,
      ),
    );
  }
}
