import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../../gen/assets.gen.dart';
import 'body_podium_area.dart';

@RoutePage()
class PodiumPage extends StatelessWidget {
  const PodiumPage({required this.winnerPlayer});

  final Player winnerPlayer;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamePlayBloc>().state;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;

    if (winnerPlayer.id == player!.id) {
      return BodyPodiumArea(
        player: player,
        opponentPlayer: opponentPlayer!,
        backGroundImage: Assets.images.backgroundWin.provider(),
        textImage: Assets.images.youWin.image(),
      );
    }
    return BodyPodiumArea(
      player: player,
      opponentPlayer: opponentPlayer!,
      backGroundImage: Assets.images.backgroundLose.provider(),
      textImage: Assets.images.youLose.image(),
    );
  }
}
