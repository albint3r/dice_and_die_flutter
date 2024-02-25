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

    return SizedBox(
      width: constraints.maxWidth * perWithColumn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: valuesToShow
            .map(
              (e) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    width: 40,
                    height: 40,
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