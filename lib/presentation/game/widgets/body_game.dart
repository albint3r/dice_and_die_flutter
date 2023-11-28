import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game/game_bloc.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final game = state.game;
    return Column(
      children: [
        Text('${game?.p1}'),
        Text('${game?.p2}'),
      ],
    );
  }
}
