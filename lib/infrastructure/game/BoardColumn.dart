import 'package:flutter/material.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    this.column = const [],
    this.onLongPress,
    super.key,
  });

  final List<int> column;
  final void Function()? onLongPress;

  List<Widget> _getColumnsPoints(List<int> column) {
    return [
      for (final points in column)
        Card(
          child: Text(
            points > 0 ? "$points" : "0",
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Card(
        color: Colors.red,
        child: SizedBox(
          height: 300,
          width: 100,
          child: Column(
            children: _getColumnsPoints(column),
          ),
        ),
      ),
    );
  }
}
