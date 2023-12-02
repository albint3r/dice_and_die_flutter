import 'package:flutter/material.dart';

class TitleH2 extends StatelessWidget {
  const TitleH2(
    this.text, {
    this.isPrimary = true,
  });

  factory TitleH2.isSecondary(String text) {
    return TitleH2(text, isPrimary: false);
  }

  final String text;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Text(
      text,
      style: theme.textTheme.titleMedium?.copyWith(
        color: isPrimary ? colorScheme.onBackground : colorScheme.onPrimary,
      ),
    );
  }
}
