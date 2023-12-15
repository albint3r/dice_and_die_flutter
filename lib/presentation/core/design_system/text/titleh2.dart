import 'package:flutter/material.dart';

class TitleH2 extends StatelessWidget {
  const TitleH2(
    this.text, {
    this.isPrimary = true,
    this.textAlign,
  });

  factory TitleH2.isSecondary(String text, {TextAlign? textAlign}) {
    return TitleH2(
      text,
      isPrimary: false,
      textAlign: textAlign,
    );
  }

  final String text;
  final bool isPrimary;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Text(
      text,
      style: theme.textTheme.titleMedium?.copyWith(
        color: isPrimary ? colorScheme.onBackground : colorScheme.onPrimary,
      ),
      textAlign: textAlign,
    );
  }
}
