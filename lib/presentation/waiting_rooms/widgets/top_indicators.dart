import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';

class TopIndicators extends StatelessWidget {
  const TopIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    final games = state.games;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.people),
              Text('Active Players: ${state.connectedPlayers}'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.casino),
              Text('Active Games: ${games.length}'),
            ],
          ),
        ],
      ),
    );
  }
}
