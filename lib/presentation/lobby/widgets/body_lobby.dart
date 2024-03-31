import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../application/lobby/lobby_bloc.dart';
import '../../../domain/game_play/enums/match_type.dart';
import '../../core/design_system/buttons/custom_floating_action_button.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';
import '../../core/router/app_router.dart';
import 'game_room_card.dart';
import 'top_indicators.dart';

class BodyLobby extends StatelessWidget {
  const BodyLobby({super.key});

  @override
  Widget build(BuildContext context) {
    final lobby = context.watch<LobbyBloc>().state;

    if (lobby.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final games = lobby.lobby.activeGames?.values.toList() ?? [];

    return Column(
      children: [
        const TopIndicators(),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return GameRoomCard(
                game: game,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topRight,
            child: CustomFloatingActionButton(),
          ),
        ),
        // const ButtonsRow(),
      ],
    );
  }
}
