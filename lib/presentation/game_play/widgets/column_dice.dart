import 'package:flutter/material.dart';

import '../../../domain/game2/entities/b_column.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class ColumnDice extends StatelessWidget {
  const ColumnDice({
    Key? key,
    required this.column,
    required this.constraints,
    this.applyReversed = false, // Agregar el parámetro booleano
  }) : super(key: key);

  final BColumn column;
  final BoxConstraints constraints;
  final bool applyReversed; // Indicador para aplicar la reversión

  @override
  Widget build(BuildContext context) {
    List<int> valuesToShow = column.values.toList(); // Crear una copia de la lista original
    print('*-'*100);
    print('valuesToShow->$valuesToShow');
    if (applyReversed) {
      valuesToShow = valuesToShow.reversed.toList(); // Reversión de la lista si applyReversed es verdadero
      print('applyReversed->$valuesToShow');
    }
    print('*-'*100);

    return SizedBox(
      width: constraints.maxWidth * perWithColumn,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: valuesToShow.map(
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
        ).toList(),
      ),
    );
  }
}
