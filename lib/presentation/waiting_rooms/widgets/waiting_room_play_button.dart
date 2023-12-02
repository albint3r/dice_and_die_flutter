import 'package:flutter/material.dart';

import '../../core/design_system/buttons/custom_short_buttom.dart';

class WaitingRoomPlayButton extends StatelessWidget {
  const WaitingRoomPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShortButton.primary(Icons.play_arrow);
  }
}
