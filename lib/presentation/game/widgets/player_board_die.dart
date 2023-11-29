import 'package:flutter/material.dart';

import '../../../domain/waiting_room/die.dart';

const size = 80.0;

class PlayerBoardDie extends StatelessWidget {
  const PlayerBoardDie({
    this.die,
    this.onTap,
    super.key,
  });

  final Die? die;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          width: size,
          height: size,
          color: Colors.white,
          child: Center(
            child: Text(
              "${die?.number ?? 0}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
