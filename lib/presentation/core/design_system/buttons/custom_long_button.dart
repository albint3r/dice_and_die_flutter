import 'package:flutter/material.dart';

import '../../theme/const_values.dart';
import '../text/titleh1.dart';

class CustomLongButton extends StatefulWidget {
  const CustomLongButton({
    this.onPressed,
    this.width = longButtonWidth,
    this.height = buttonHeight,
    required this.text,
  })  : assert(
          width >= longButtonWidth,
          'Width must be at least $longButtonWidth',
        ),
        assert(
          height >= buttonHeight,
          'Height must be at least $buttonHeight',
        );

  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;

  @override
  State<CustomLongButton> createState() => _CustomLongButtonState();
}

class _CustomLongButtonState extends State<CustomLongButton> {
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

  void _onPressed() {
    setState(() {
      isClicked = true;
    });
    // Without this you would have an error.
    final wOnPressed = widget.onPressed;
    if (wOnPressed != null) {
      wOnPressed();
    }
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
          bottom: 5,
          child: ElevatedButton(
            onPressed: widget.onPressed != null ? _onPressed : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                widget.width,
                widget.height,
              ),
            ),
            child: TitleH1(
              text: widget.text,
            ),
          ),
        )
      ],
    );
  }
}
