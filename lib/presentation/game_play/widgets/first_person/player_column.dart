// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/b_column.dart';
import '../../../core/design_system/text/titleh2.dart';
import '../../../core/theme/const_values.dart';

class PlayerColumn extends StatelessWidget {
  const PlayerColumn({
    required this.index,
    required this.column,
  });

  final int index;
  final BColumn column;

  BoxDecoration _buildBoxDecoration({
    required Color bgColor,
    required Color borderColor,
  }) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          borderRadius,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: bgColor,
          offset: const Offset(1, 4),
          spreadRadius: -5,
          blurRadius: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coloScheme = theme.colorScheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: _buildBoxDecoration(
                    bgColor: coloScheme.onPrimary,
                    borderColor: coloScheme.secondary,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * perWithColumn,
                    maxHeight: constraints.maxHeight * perMaxHeightScoreField,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<GamePlayBloc>().add(
                        GamePlayEvent.selectColumn(index),
                      ),
                  child: Container(
                    decoration: _buildBoxDecoration(
                      bgColor: coloScheme.onBackground,
                      borderColor: coloScheme.onPrimary,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth * perWithColumn,
                      maxHeight: constraints.maxHeight * perMaxHeightColumn,
                    ),
                    child: SizedBox(
                      width: constraints.maxWidth * perWithColumn,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: column.values
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
                    ),
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
