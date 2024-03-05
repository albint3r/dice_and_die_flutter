import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/game_play/entities/game.dart';
import '../../../../domain/game_play/entities/player.dart';
import '../../../../gen/assets.gen.dart';
import '../../application/auth/auth_bloc.dart';
import '../../application/podium/podium_bloc.dart';
import '../../injectables.dart';
import 'widgets/body_podium_ranking.dart';

@RoutePage()
class PodiumPage extends StatelessWidget {
  const PodiumPage({
    required this.player,
    required this.opponentPlayer,
    required this.winnerPlayer,
    required this.game,
  });

  final Game game;
  final Player player;
  final Player opponentPlayer;
  final (Player, Player?) winnerPlayer;

  BodyPodiumRanking _getPodiumArea() {
    final isTie = winnerPlayer is (Player, Player);
    final winner = winnerPlayer.$1;
    final isPlayerWinner = winner == player;

    if (isTie) {
      return BodyPodiumRanking(
        gameState: game.gameState!,
        winnerPlayer: player,
        player: player,
        opponentPlayer: opponentPlayer,
        backGroundImage: Assets.images.backgroundWin.provider(),
        textImage: Assets.images.youWin.image(),
      );
    }
    if (isPlayerWinner) {
      return BodyPodiumRanking(
        gameState: game.gameState!,
        winnerPlayer: winner,
        player: player,
        opponentPlayer: opponentPlayer,
        backGroundImage: Assets.images.backgroundWin.provider(),
        textImage: Assets.images.youWin.image(),
      );
    }
    return BodyPodiumRanking(
      gameState: game.gameState!,
      winnerPlayer: winner,
      player: player,
      opponentPlayer: opponentPlayer,
      backGroundImage: Assets.images.backgroundLose.provider(),
      textImage: Assets.images.youLose.image(),
    );
  }

  bool get isWinner =>
      winnerPlayer is (Player, Player) || player == winnerPlayer.$1;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final rankId = auth.appUser?.userLevel.rankId ?? 0;
    return BlocProvider(
      create: (context) => getIt<PodiumBloc>()
        ..add(
          PodiumEvent.started(rankId),
        )
        ..add(
          isWinner
              ? const PodiumEvent.playWinSound()
              : const PodiumEvent.playLoseSound(),
        ),
      child: Scaffold(
        body: SafeArea(
          child: _getPodiumArea(),
        ),
      ),
    );
  }
}
