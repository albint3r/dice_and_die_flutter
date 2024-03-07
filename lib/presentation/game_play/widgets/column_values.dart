import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

import '../../../domain/game_play/entities/b_column.dart';
import '../../core/design_system/animations/custom_animation_container.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ColumnValues extends StatelessWidget {
  const ColumnValues({
    required this.column,
    required this.constraints,
    this.applyReversed = false,
  });

  final BColumn column;
  final BoxConstraints constraints;
  final bool applyReversed;

  /// Add color and shadow if the Dice have more than one coincidence
  BoxDecoration _buildColorDiceSelectorDecoration(
      ColorScheme colorScheme, int diceValue) {
    final count = column.counter[diceValue]!;
    final double spreadRadius;
    final List<Color> colors;
    if (count > 2) {
      colors = [
        colorScheme.onPrimary,
        colorScheme.surface,
      ];
      spreadRadius = 5;
    } else if (count > 1) {
      colors = [
        colorScheme.onPrimary,
        colorScheme.onPrimary,
        colorScheme.surface,
      ];
      spreadRadius = 1;
    } else {
      colors = [colorScheme.onPrimary, colorScheme.onPrimary];
      spreadRadius = 0;
    }
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        colors: colors,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          borderRadius,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: colorScheme.surface,
          blurRadius: count > 1 ? 15 : 0,
          spreadRadius: spreadRadius,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    List<int> valuesToShow = column.values.toList();
    if (applyReversed) {
      valuesToShow = valuesToShow.reversed.toList();
    }
    final diceSize = (constraints.maxHeight - 110) / 3;

    return SizedBox(
      width: constraints.maxWidth * perWithColumn,
      child: Column(
        mainAxisAlignment:
            applyReversed ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: valuesToShow
            .map(
              (diceValue) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: CustomAnimationContainer(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: diceSize,
                      maxWidth: diceSize,
                    ),
                    decoration: _buildColorDiceSelectorDecoration(
                      colorScheme,
                      diceValue,
                    ),
                    child: Center(
                      child: TitleH2('$diceValue'),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
