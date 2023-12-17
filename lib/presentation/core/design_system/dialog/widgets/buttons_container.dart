import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../buttons/custom_long_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  BoxDecoration _boxDecoration(ColorScheme colorScheme) => BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _boxDecoration(colorScheme),
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomLongButton(
              text: 'World Ranking',
              width: size.width * .80,
            ),
            const Gap(10),
            CustomLongButton(
              text: 'Update Name',
              width: size.width * .80,
            ),
          ],
        ),
      ),
    );
  }
}
