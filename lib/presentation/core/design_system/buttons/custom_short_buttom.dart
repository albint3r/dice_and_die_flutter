import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class CustomShortButton extends StatelessWidget {
  const CustomShortButton({
    this.onPressed,
    this.width = shortButtonWidth,
    this.height = buttonHeight,
    this.isPrimary = false,
    required this.icon,
  })  : assert(
          width >= shortButtonWidth,
          'Width must be at least $shortButtonWidth',
        ),
        assert(
          height >= buttonHeight,
          'Height must be at least $buttonHeight',
        );

  final IconData icon;
  final double width;
  final double height;
  final bool isPrimary;
  final void Function()? onPressed;

  factory CustomShortButton.primary(
    IconData icon, {
    void Function()? onPressed,
    double width = shortButtonWidth,
    double height = buttonHeight,
  }) {
    return CustomShortButton(
      icon: icon,
      onPressed: onPressed,
      width: width,
      height: height,
      isPrimary: true,
    );
  }

  factory CustomShortButton.secondary(
    IconData icon, {
    void Function()? onPressed,
    double width = shortButtonWidth,
    double height = buttonHeight,
  }) {
    return CustomShortButton(
      icon: icon,
      onPressed: onPressed,
      width: width,
      height: height,
    );
  }

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

  ButtonStyle _buildButtonStyle(ColorScheme colorScheme) {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all<Size>(
        Size(
          width,
          height,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSecondary;
        }
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.background;
        }
        return isPrimary ? colorScheme.primary : colorScheme.onPrimary;
      }),
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
            style: _buildButtonStyle(
              colorScheme,
            ),
            child: Icon(icon,
                color: isPrimary
                    ? colorScheme.onPrimary
                    : colorScheme.onBackground),
          ),
        )
      ],
    );
  }
}
