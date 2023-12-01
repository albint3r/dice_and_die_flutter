import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/router/app_router.dart';
import 'game_tile.dart';

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
        ElevatedButton(
          onPressed: () {
            context.router.replace(GameRoute());
            context.read<WaitingRoomBloc>().add(
                  const WaitingRoomEvent.reloadEvents(),
                );
          },
          child: const Text('Create Game'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<WaitingRoomBloc>().add(
                  const WaitingRoomEvent.reloadEvents(),
                );
          },
          child: const Text('Reload Events'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return GameTile(game: game);
            },
          ),
        )
      ],
    );
  }
}
