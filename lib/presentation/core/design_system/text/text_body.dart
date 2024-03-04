import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class TextBody extends StatelessWidget {
  const TextBody(
    this.text, {
    this.textAlign,
    this.maxLines = 1,
    this.fontSize = body,
    this.color,
  });

  final String text;
  final TextAlign? textAlign;
  final int maxLines;
  final double fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: fontSize,
        color: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
    );
  }
}
