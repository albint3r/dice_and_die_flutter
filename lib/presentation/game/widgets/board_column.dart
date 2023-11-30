import 'package:flutter/material.dart';

const dieSize = 35.0;

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    this.column = const [],
    required this.isFirstPerson,
    this.onLongPress,
    super.key,
  });

  final List<int> column;
  final bool isFirstPerson;
  final void Function()? onLongPress;

  List<Widget> _getColumnsPoints(List<int> column) {
    return [
      for (final points in column)
        Card(
          elevation: 15,
          color: Colors.white,
          child: SizedBox(
            height: dieSize,
            width: dieSize,
            child: Center(
              child: Text(
                points > 0 ? "$points" : "0",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.green,
          child: SizedBox(
            height: 300,
            width: 100,
            child: Column(
              mainAxisAlignment: isFirstPerson
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: _getColumnsPoints(column),
            ),
          ),
        ),
      ),
    );
  }
}
