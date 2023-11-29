import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/router/app_router.dart';

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
          onPressed: () => context.router.push(GameRoute()),
          child: const Text('Create Game'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return Card(
                child: ListTile(
                  onTap: () => context.router.push(
                    GameRoute(
                      game: game,
                    ),
                  ),
                  title: Text('Game id: ${game.id}'),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(game.isFull ? 'Is Full' : 'Not Full')],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
