import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WaitingGameRoom extends StatelessWidget {
  const WaitingGameRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Waiting Player\nJoin Match', textAlign: TextAlign.center),
          Gap(20),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
