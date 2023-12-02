import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium,
    );
  }
}
