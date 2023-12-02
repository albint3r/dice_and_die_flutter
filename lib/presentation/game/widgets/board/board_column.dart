import 'package:flutter/material.dart';

import '../../../core/theme/const_values.dart';

const dieSize = 35.0;

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    this.column = const [],
    required this.isFirstPerson,
    this.onLongPress,
    super.key,
  });

  final List<int> column;
  final bool isFirstPerson;
  final void Function()? onLongPress;

  List<Widget> _getColumnsPoints(
    List<int> column,
    ColorScheme colorScheme,
  ) {
    const boxSize = 50.0;
    return [
      for (final points in column)
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: Center(
            child: Text(
              points > 0 ? "$points" : "0",
              style: TextStyle(
                fontSize: diceNumberFontSize,
                color: colorScheme.onBackground,
              ),
            ),
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return InkWell(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.only(
          top: padding,
          bottom: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: const BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          width: 75,
          height: 150,
          child: Column(
            mainAxisAlignment: isFirstPerson ? MainAxisAlignment.start:MainAxisAlignment.end,
            children: _getColumnsPoints(
              column,
              colorScheme,
            ),
          ),
        ),
      ),
    );
  }
}
