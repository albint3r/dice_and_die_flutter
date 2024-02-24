import 'package:flutter/material.dart';

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print('*-' * 100);
            print('constraints-->$constraints');
            print('*-' * 100);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * .90,
                    maxHeight: constraints.maxHeight * .20,
                  ),
                ),
                Container(
                  color: Colors.greenAccent,
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * .90,
                    maxHeight: constraints.maxHeight * .80,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
