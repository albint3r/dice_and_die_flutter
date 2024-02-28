import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../core/design_system/text/text_body.dart';

class FloatingActionGamePlayButton extends StatefulWidget {
  const FloatingActionGamePlayButton({super.key});

  @override
  State<FloatingActionGamePlayButton> createState() =>
      _FloatingActionGamePlayButtonState();
}

class _FloatingActionGamePlayButtonState
    extends State<FloatingActionGamePlayButton> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void _toggle() => setState(() => isDialOpen.value = !isDialOpen.value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SpeedDial(
      activeIcon: Icons.close,
      curve: Curves.bounceIn,
      elevation: 5,
      backgroundColor: colorScheme.onSecondary,
      openCloseDial: isDialOpen,
      onPress: _toggle,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.send),
        ),
        SpeedDialChild(
          child: const Icon(Icons.money),
        ),
      ],
      child: const Icon(Icons.chat),
    );
  }
}
