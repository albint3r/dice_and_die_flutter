import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../router/app_router.dart';
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
              text: 'Profile',
              width: size.width * .80,
              onPressed: () => context.router.push(const ProfileRoute()),
            ),
            const Gap(10),
            CustomLongButton(
              text: 'Ranking',
              width: size.width * .80,
            ),
          ],
        ),
      ),
    );
  }
}
