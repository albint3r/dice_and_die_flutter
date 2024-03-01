import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/lobby/lobby_bloc.dart';

import '../../../../domain/game_play/entities/player.dart';
import '../../../../domain/game_play/enums/enum_game_state.dart';
import '../../application/podium/podium_bloc.dart';
import '../core/design_system/app_bar/widgets/user_level_progress_bar_podium.dart';
import '../core/design_system/buttons/custom_long_button.dart';
import '../core/design_system/text/titleh1.dart';
import '../core/router/app_router.dart';
import '../core/theme/const_values.dart';
import 'game_stats_info_container.dart';

class BodyPodiumArea extends StatelessWidget {
  const BodyPodiumArea({
    required this.player,
    required this.opponentPlayer,
    required this.backGroundImage,
    required this.textImage,
    required this.winnerPlayer,
    required this.gameState,
  });

  final Player player;

  final Player opponentPlayer;

  final Player winnerPlayer;
  final EnumGameState gameState;

  final ImageProvider<Object> backGroundImage;
  final Widget textImage;

  int _getWinPoints() {
    if (gameState == EnumGameState.disconnectPlayer) {
      return baseExpPoints;
    }
    if (winnerPlayer == player) {
      return (player.board.score - opponentPlayer.board.score).abs() +
          baseExpPoints;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<PodiumBloc>().state;
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: backGroundImage,
        ),
      ),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                children: [
                  TitleH1(
                    text: 'Exp Won: ${_getWinPoints()}',
                    fontSize: 50,
                    color: colorScheme.onSecondary,
                  ),
                  UserLevelProgressBarPodium(
                    player.appUser,
                  ),
                ],
              ),
            ),
            const Gap(50),
            Stack(
              children: [
                GameStatsInfoContainer(
                  player: player,
                  opponentPlayer: opponentPlayer,
                ),
                Positioned(
                  left: 25,
                  child: textImage,
                ),
              ],
            ),
            const Gap(10),
            CustomLongButton(
              text: 'Go Back Menu',
              width: waitingRoomCardWidth * .80,
              onPressed: () {
                context.router.replaceAll(
                  [const LobbyRoute()],
                );
                context.read<AuthBloc>().add(
                      AuthEvent.notifyUserUpdatesAfterGameEnds(
                        player.appUser,
                      ),
                    );
                context.read<LobbyBloc>().add(
                      const LobbyEvent.updateLobbyGames(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
