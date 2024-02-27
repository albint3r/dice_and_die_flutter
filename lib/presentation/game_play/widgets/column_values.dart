import 'package:flutter/material.dart';

import '../../../domain/game2/entities/b_column.dart';
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

  BoxDecoration _buildBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.onPrimary,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          borderRadius,
        ),
      ),
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
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: diceSize,
                    maxWidth: diceSize,
                  ),
                  decoration: _buildBoxDecoration(colorScheme),
                  child: Center(
                    child: TitleH2('$e'),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
