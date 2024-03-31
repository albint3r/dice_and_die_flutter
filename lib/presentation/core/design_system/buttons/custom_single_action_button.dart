import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class CustomSingleActionButton extends StatelessWidget {
  const CustomSingleActionButton({
    required this.icon,
    this.width = shortButtonWidth,
    this.height = buttonHeight,
  });

  final IconData icon;
  final double width;
  final double height;

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
          bottom: padding,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            width: width,
            height: height,
            child: Icon(
              icon,
              color: colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
