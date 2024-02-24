import 'package:flutter/material.dart';

import '../../core/theme/const_values.dart';
import 'game_board.dart';

class GameArea extends StatelessWidget {
  const GameArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightWithoutBottomBar = (size.height - bottomAppBarHeight) / 2;
    return Container(
      color: Colors.red,
      height: heightWithoutBottomBar,
      width: size.width,
      child: const Column(
        children: [
          GameBoard(),
        ],
      ),
    );
  }
}
