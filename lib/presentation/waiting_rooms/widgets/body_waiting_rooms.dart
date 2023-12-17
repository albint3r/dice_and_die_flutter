import 'package:dice_and_die_flutter/presentation/waiting_rooms/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import 'create_game_button.dart';
import 'top_indicators.dart';
import 'waiting_room_card.dart';

class BodyWaitingRooms extends StatelessWidget {
  const BodyWaitingRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    final games = state.games;
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        const TopIndicators(),
        // const WaitingRoomCard(),
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
