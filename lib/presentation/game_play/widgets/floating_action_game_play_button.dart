import 'package:flutter/material.dart';

class FloatingActionGamePlayButton extends StatelessWidget {
  const FloatingActionGamePlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Text('Hello'),
      shape: const CircleBorder(),
    );
  }
}
