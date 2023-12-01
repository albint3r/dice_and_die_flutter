import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class CustomLongButton extends StatelessWidget {
  const CustomLongButton({
    this.onPressed,
    this.width = longButtonWidth,
    this.height = buttonHeight,
    required this.text,
  })  : assert(width >= longButtonWidth, 'Width must be at least $longButtonWidth'),
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
          top: 0,
          left: 0,
          bottom: 5,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                width,
                height,
              ),
            ),
            child: Text(text),
          ),
        )
      ],
    );
  }
}
