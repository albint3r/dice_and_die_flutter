import 'package:flutter/material.dart';

import '../../../domain/game2/entities/b_column.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ColumnValues extends StatelessWidget {
  const ColumnValues({
    required this.column,
    required this.constraints,
    this.applyReversed = false,
  });

  final BColumn column;
  final BoxConstraints constraints;
  final bool applyReversed;

  @override
  Widget build(BuildContext context) {
    List<int> valuesToShow = column.values.toList();
    if (applyReversed) {
      valuesToShow = valuesToShow.reversed.toList();
    }
    final diceSize = (constraints.maxHeight - 100) / 3;
    print('*-' * 100);
    print('diceSize->${diceSize}');
    print('*-' * 100);
    return SizedBox(
      width: constraints.maxWidth * perWithColumn,
      child: Column(
        mainAxisAlignment:
            applyReversed ? MainAxisAlignment.end : MainAxisAlignment.start,
        // children: valuesToShow
        children: [1, 2, 3]
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Container(
                    color: Colors.white,
                    constraints: BoxConstraints(
                      maxHeight: diceSize,
                      maxWidth: diceSize,
                    ),
                    child: Center(
                      child: TitleH2('$e'),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
