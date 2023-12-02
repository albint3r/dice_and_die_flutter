import 'package:flutter/material.dart';

import '../../theme/const_values.dart';
import '../text/titleh1.dart';

class CustomLongButton extends StatelessWidget {
  const CustomLongButton({
    this.onPressed,
    this.width = longButtonWidth,
    this.height = buttonHeight,
    required this.text,
  })  : assert(width >= longButtonWidth,
            'Width must be at least $longButtonWidth'),
        assert(height >= buttonHeight, 'Height must be at least $buttonHeight');

  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;

  BoxDecoration _buildBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          borderRadius,
        ),
      ),
      color: colorScheme.onSecondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const zero = 0.0;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: width,
          height: height,
          decoration: _buildBoxDecoration(
            colorScheme,
          ),
        ),
        Positioned(
          top: zero,
          left: zero,
          bottom: 5,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                width,
                height,
              ),
            ),
            child: TitleH1(text: text),
          ),
        )
      ],
    );
  }
}
