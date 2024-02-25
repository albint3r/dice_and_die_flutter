import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class TextBody extends StatelessWidget {
  const TextBody(
    this.text, {
    this.textAlign,
    this.maxLines = 1,
    this.fontSize = body,
  });

  final String text;
  final TextAlign? textAlign;
  final int maxLines;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
    );
  }
}
