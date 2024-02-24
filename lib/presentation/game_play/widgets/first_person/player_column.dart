import 'package:flutter/material.dart';

import '../../../core/theme/const_values.dart';

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              constraints: const BoxConstraints(
                maxWidth: 200,
                maxHeight: 50,
              ),
            ),
            Container(
              color: Colors.greenAccent,
              constraints: const BoxConstraints(
                maxWidth: 200,
                maxHeight: 270,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
