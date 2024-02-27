import 'package:flutter/material.dart';

class BottomAppGameBar extends StatelessWidget {
  const BottomAppGameBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return BottomAppBar(
      color: colorScheme.primary,
      height: 35,
      shape: const CircularNotchedRectangle(),
    );
  }
}
