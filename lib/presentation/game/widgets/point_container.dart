import 'package:flutter/material.dart';

import '../../../domain/waiting_room/player.dart';

class PointContainer extends StatelessWidget {
  const PointContainer(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      width: 100,
      height: 20,
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
