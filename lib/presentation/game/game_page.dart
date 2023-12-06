import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../application/game_notifications/game_notifications_bloc.dart';
import '../../application/waiting_room/waiting_room_bloc.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';
import '../../injectables.dart';
import '../core/router/app_router.dart';
import 'widgets/body_game.dart';

@RoutePage()
class GamePage extends StatelessWidget {
  const GamePage({
    this.game,
  });

  final Game? game;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GameBloc>()
            ..add(
              GameEvent.started(game),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<GameNotificationsBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          // This update the values of the user when:
          // Enter a room
          // Update the board score
          // Leave the room
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) =>
                prev.player != curr.player && curr.player is Player,
            listener: (context, state) {
              context.read<WaitingRoomBloc>().add(
                    const WaitingRoomEvent.reloadEvents(),
                  );
            },
          ),
          // This event listener create a ui notification to show witch player
          // is going next.
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) => prev.game?.state != curr.game?.state,
            listener: (context, state) {
              context.read<GameNotificationsBloc>().add(
                    GameNotificationsEvent.update(
                      game: state.game!,
                    ),
                  );
            },
          ),
          // This send a message to finished the current game, but need to notify
          // the server that the game is disconnected.
        ],
        child: const SafeArea(
          child: Scaffold(
            body: BodyGame(),
          ),
        ),
      ),
    );
  }
}
