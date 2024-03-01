import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../core/design_system/text/text_body.dart';

class NamesAndLevels extends StatelessWidget {
  const NamesAndLevels({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamePlayBloc>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBody('${state.player?.appUser.name}'),
            TextBody(
              'lvl:${state.player?.appUser.userLevel.level}',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextBody('${state.opponentPlayer?.appUser.name}'),
            TextBody(
              'lvl:${state.opponentPlayer?.appUser.userLevel.level}',
            ),
          ],
        ),
      ],
    );
  }
}
