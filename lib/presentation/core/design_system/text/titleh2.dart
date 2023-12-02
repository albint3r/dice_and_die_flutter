import 'package:flutter/material.dart';

class TitleH2 extends StatelessWidget {
  const TitleH2(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.titleMedium,
    );
  }
}
