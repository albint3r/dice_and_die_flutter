import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/router/app_router.dart';
import 'lose_area.dart';
import 'win_area.dart';

class PodiumArea extends StatelessWidget {
  const PodiumArea({
    required this.winnerPlayer,
    super.key,
  });

  final Player winnerPlayer;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameBloc>().state;
    final player = state.player;
    final opponentPlayer = state.opponentPlayer;

    if (winnerPlayer.id == player!.id) {
      return WinArea(
        player: player,
        opponentPlayer: opponentPlayer,
      );
    }
    return LoseArea(
      player: player,
      opponentPlayer: opponentPlayer,
    );
  }
}
