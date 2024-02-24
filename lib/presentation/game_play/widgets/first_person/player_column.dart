import 'package:flutter/material.dart';

import '../../../core/theme/const_values.dart';

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coloScheme = theme.colorScheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print('*-' * 100);
            print('constraints-->$constraints');
            print('*-' * 100);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: coloScheme.onPrimary,
                    border: Border.all(
                      color: coloScheme.secondary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        borderRadius,
                      ),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * .90,
                    maxHeight: constraints.maxHeight * .10,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: coloScheme.onBackground,
                    border: Border.all(
                      color: coloScheme.onPrimary,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        borderRadius,
                      ),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * .90,
                    maxHeight: constraints.maxHeight * .85,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
