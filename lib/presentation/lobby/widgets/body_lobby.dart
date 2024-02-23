import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/lobby/lobby_bloc.dart';
import '../../waiting_rooms/widgets/create_game_button.dart';
import '../../waiting_rooms/widgets/refresh_button.dart';
import '../../waiting_rooms/widgets/top_indicators.dart';
import '../../waiting_rooms/widgets/waiting_room_card.dart';

class BodyLobby extends StatelessWidget {
  const BodyLobby({super.key});

  @override
  Widget build(BuildContext context) {
    final lobby = context.watch<LobbyBloc>().state;
    if (lobby.isLoading) const Center(child: CircularProgressIndicator());
    final games = lobby.lobby.activeGames?.values.toList() ?? [];

    return Column(
      children: [
        const TopIndicators(),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return WaitingRoomCard(
                game: game,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreateGameButton(),
              RefreshButton(),
            ],
          ),
        ),
        // const ButtonsRow(),
      ],
    );
  }
}
