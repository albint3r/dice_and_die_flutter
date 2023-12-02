import 'package:flutter/material.dart';

class TitleH1 extends StatelessWidget {
  const TitleH1({
    required this.text,
    this.textAlign,
  });

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.titleLarge,
    );
  }
}
