import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/app_bar/widgets/user_level_progress_bar_podium.dart';
import '../../../core/design_system/buttons/custom_long_button.dart';
import '../../../core/design_system/text/titleh1.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/const_values.dart';
import 'game_info_container.dart';

class PodiumLayout extends StatelessWidget {
  const PodiumLayout({
    required this.player,
    this.opponentPlayer,
    required this.backGroundImage,
    required this.textImage,
  });

  final Player player;

  final Player? opponentPlayer;

  final ImageProvider<Object> backGroundImage;
  final Widget textImage;

  int _getWinPoints(AuthState auth) =>
      player.appUser!.userLevel.expPoints - auth.appUser!.userLevel.expPoints;


  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
                    text: 'Exp Won: ${_getWinPoints(auth)}',
                    fontSize: 50,
                    color: colorScheme.onSecondary,
                  ),
                  UserLevelProgressBarPodium(player.appUser!),
                ],
              ),
            ),
            const Gap(50),
            Stack(
              children: [
                GameInfoContainer(
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
              onPressed: () => context.router.replace(
                const WaitingRoomsRoute(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
