import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/podium/podium_bloc.dart';
import '../../../domain/game_play/entities/player.dart';
import '../../../domain/game_play/enums/enum_game_state.dart';
import '../../core/design_system/app_bar/widgets/user_level_progress_bar_podium.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/theme/const_values.dart';
import '../../profile/widgets/profile_image.dart';
import '../widgets/game_stats_info_container.dart';

const avatarSize = 150.0;

class UserGameFinalResultInfo extends StatelessWidget {
  const UserGameFinalResultInfo({
    required this.player,
    required this.opponentPlayer,
    required this.winnerPlayer,
    required this.gameState,
    required this.backGroundImage,
    required this.textImage,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<PodiumBloc>().state;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(padding * 2),
      child: Card(
        elevation: elevation,
        child: Container(
          // color: colorScheme.onSecondary,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backGroundImage,
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          height: 490,
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              children: [
                const ProfileImage(
                  width: avatarSize,
                  height: avatarSize,
                ),
                TitleH1(text: 'League Rank: ${state.userLeagueRanking}'),
                Column(
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
                const Gap(30),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
