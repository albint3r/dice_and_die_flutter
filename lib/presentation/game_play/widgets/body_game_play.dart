import 'package:dice_and_die_flutter/presentation/game_play/widgets/second_person/second_person_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/game_play/game_play_bloc.dart';
import 'first_person/first_person_area.dart';

class BodyGamePlay extends StatelessWidget {
  const BodyGamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    final gamePlay = context.watch<GamePlayBloc>().state;
    if (gamePlay.isLoading) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SecondPersonArea(),
        Divider(color: Colors.black, height: 10, thickness: 5),
        FirstPersonArea(),
      ],
    );
  }
}
