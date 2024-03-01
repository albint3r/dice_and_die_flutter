import 'package:flutter/material.dart';

import '../../../domain/game_play/entities/b_column.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ScoreField extends StatelessWidget {
  const ScoreField({
    required this.constraints,
    required this.column,
  });

  final BoxConstraints constraints;
  final BColumn column;

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
    return Container(
      decoration: _buildBoxDecoration(
        bgColor: coloScheme.onPrimary,
        borderColor: coloScheme.secondary,
      ),
      constraints: BoxConstraints(
        maxWidth: constraints.maxWidth * perWithColumn,
        maxHeight: constraints.maxHeight * perMaxHeightScoreField,
      ),
      child: SizedBox(
        width: constraints.maxWidth * perWithColumn,
        child: Center(
          child: TitleH2('${column.score}'),
        ),
      ),
    );
  }
}
