import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody(this.text, {this.maxLines = 1});

  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium,
      maxLines: maxLines,
      overflow: TextOverflow.fade,
    );
  }
}
