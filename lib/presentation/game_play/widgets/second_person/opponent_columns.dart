import 'package:flutter/material.dart';

import '../../../core/theme/const_values.dart';

class OpponentColumns extends StatelessWidget {
  const OpponentColumns({super.key});

  BoxDecoration _buildBoxDecoration({
    required Color bgColor,
    required Color borderColor,
  }) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          borderRadius,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: bgColor,
          offset: const Offset(1, 4),
          spreadRadius: -5,
          blurRadius: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coloScheme = theme.colorScheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: _buildBoxDecoration(
                    bgColor: coloScheme.onBackground,
                    borderColor: coloScheme.onPrimary,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * perWithColumn,
                    maxHeight: constraints.maxHeight * perMaxHeightColumn,
                  ),
                ),
                Container(
                  decoration: _buildBoxDecoration(
                    bgColor: coloScheme.onPrimary,
                    borderColor: coloScheme.secondary,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * perWithColumn,
                    maxHeight: constraints.maxHeight * perMaxHeightScoreField,
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
