import 'package:flutter/material.dart';

class TitleH1 extends StatelessWidget {
  const TitleH1({
    required this.text,
    this.textAlign,
    this.color,
    this.fontSize,
  });

  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.titleLarge?.copyWith(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
