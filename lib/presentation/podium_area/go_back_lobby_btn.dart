import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../application/lobby/lobby_bloc.dart';
import '../../domain/game_play/entities/player.dart';
import '../core/design_system/buttons/custom_long_button.dart';
import '../core/router/app_router.dart';
import '../core/theme/const_values.dart';

class GoBackLobbyBtn extends StatelessWidget {
  const GoBackLobbyBtn({
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return CustomLongButton(
      text: 'Go Back Lobby',
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
    );
  }
}
