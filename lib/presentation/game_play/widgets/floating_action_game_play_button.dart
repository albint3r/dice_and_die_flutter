import 'package:flutter/material.dart';

class FloatingActionGamePlayButton extends StatelessWidget {
  const FloatingActionGamePlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return FloatingActionButton(
      backgroundColor: colorScheme.onSecondary,
      onPressed: () {},
      shape: const CircleBorder(),
      child: const Text('Chat'),
    );
  }
}
