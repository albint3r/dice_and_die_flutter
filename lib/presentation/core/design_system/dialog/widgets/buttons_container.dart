import 'package:flutter/material.dart';

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
    return Container(
      decoration: _boxDecoration(colorScheme),
      width: double.infinity,
      height: double.infinity,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
