import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../application/lobby/lobby_bloc.dart';
import '../../../../domain/game_play/enums/match_type.dart';
import '../../router/app_router.dart';
import '../../theme/const_values.dart';
import 'custom_single_action_button.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SpeedDial(
      icon: Icons.games,
      activeIcon: Icons.close,
      backgroundColor: colorScheme.secondary,
      gradientBoxShape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        colors: [
          colorScheme.primary,
          colorScheme.error,
        ],
      ),
      elevation: 15,
      buttonSize: const Size(shortButtonWidth, shortButtonWidth),
      overlayColor: colorScheme.onBackground,
      spacing: columnPadding,
      spaceBetweenChildren: columnPadding,
      childrenButtonSize: const Size(shortButtonWidth, buttonHeight),
      animationCurve: Curves.elasticOut,
      children: [
        SpeedDialChild(
          label: 'Create Game',
          child: const CustomSingleActionButton(
            icon: Icons.casino,
          ),
          onTap: () => context.router.push(
            CreateOrJoinGameRoute(),
          ),
        ),
        SpeedDialChild(
          label: 'Play AI',
          child: const CustomSingleActionButton(
            icon: Icons.smart_toy_outlined,
          ),
          onTap: () => context.router.push(
            CreateOrJoinGameRoute(
              matchType: MatchType.ai,
            ),
          ),
        ),
        SpeedDialChild(
          label: 'Refresh',
          child: const CustomSingleActionButton(
            icon: Icons.refresh,
          ),
          onTap: () => context.read<LobbyBloc>().add(
                const LobbyEvent.updateLobbyGames(),
              ),
        ),
      ],
    );
  }
}
