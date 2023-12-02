import 'package:flutter/material.dart';

class TextBodySmall extends StatelessWidget {
  const TextBodySmall(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodySmall,
    );
  }
}
