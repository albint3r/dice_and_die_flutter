import 'package:flutter/material.dart';

import '../../theme/const_values.dart';

class CustomShortButton extends StatefulWidget {
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

  @override
  State<CustomShortButton> createState() => _CustomShortButtonState();
}

class _CustomShortButtonState extends State<CustomShortButton> {
  bool isClicked = false;

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
          widget.width,
          widget.height,
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
        return widget.isPrimary ? colorScheme.primary : colorScheme.onPrimary;
      }),
    );
  }

  void _onPressed() {
    setState(() {
      isClicked = true;
    });
    widget.onPressed!();
  }

  void _onEnd() {
    setState(() {
      isClicked = false;
    });
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
          width: widget.width,
          height: widget.height,
          decoration: _buildBoxDecoration(
            colorScheme,
          ),
        ),
        AnimatedPositioned(
          onEnd: _onEnd,
          duration: animationButtonDuration,
          top: zero,
          left: zero,
          bottom: isClicked ? zero : 5,
          child: ElevatedButton(
            // onPressed: widget.onPressed,
            onPressed: _onPressed,
            style: _buildButtonStyle(
              colorScheme,
            ),
            child: Icon(
              widget.icon,
              color: widget.isPrimary
                  ? colorScheme.onPrimary
                  : colorScheme.onBackground,
            ),
          ),
        )
      ],
    );
  }
}
