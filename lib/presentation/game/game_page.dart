import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../application/game_life/game_life_bloc.dart';
import '../../application/game_notifications/game_notifications_bloc.dart';
import '../../application/sounds_effects/sounds_effects_bloc.dart';
import '../../application/waiting_room/waiting_room_bloc.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/game_state.dart';
import '../../domain/waiting_room/player.dart';
import '../../injectables.dart';
import 'widgets/body_game.dart';

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
        BlocProvider(
          create: (context) => getIt<SoundsEffectsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GameLifeBloc>(),
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
          // is going next. This is the mid banner in the board.
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) =>
                prev.game?.state != curr.game?.state &&
                curr.game?.state != GameAppState.finishGame,
            listener: (context, state) {
              context.read<GameNotificationsBloc>().add(
                    GameNotificationsEvent.update(
                      game: state.game!,
                    ),
                  );
            },
          ),
          // This listener helps to reproduce the sound on each State Stage
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) =>
                prev.game?.state != curr.game?.state &&
                curr.game?.state != GameAppState.finishGame,
            listener: (context, state) {
              if (state.game?.state == GameAppState.rollDice) {
                context.read<SoundsEffectsBloc>().add(
                      const SoundsEffectsEvent.playRollDice(),
                    );
              }
              if (state.game?.state == GameAppState.selectColumn) {
                context.read<SoundsEffectsBloc>().add(
                      const SoundsEffectsEvent.stopRollDice(),
                    );
              }
            },
          ),
          // Dispose All the controls to avoid sound errors after the game finish.
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) =>
                prev.game?.state != curr.game?.state &&
                curr.game?.state == GameAppState.finishGame,
            listener: (context, state) {
              context.read<SoundsEffectsBloc>().add(
                    const SoundsEffectsEvent.disposeRollDice(),
                  );
            },
          ),
          // Validate if the winner is the app user to update the level points
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) =>
                prev.game?.state != curr.game?.state &&
                curr.game?.state == GameAppState.finishGame,
            listener: (context, state) {
              context.read<GameBloc>().add(
                    const GameEvent.updateWinnerProfile(),
                  );
            },
          ),
          // If the sound dice effect is completed it means the user
          // don't throw the dice, so The app will force to throw the dice
          BlocListener<SoundsEffectsBloc, SoundsEffectsState>(
            listenWhen: (prev, curr) =>
                prev.isRollDiceSoundComplete != curr.isRollDiceSoundComplete &&
                curr.isRollDiceSoundComplete,
            listener: (context, state) => context.read<GameBloc>().add(
                  const GameEvent.rollDice(),
                ),
          ),
          // This Listener update the Game Life Score on each players:
          BlocListener<GameBloc, GameState>(
            listenWhen: (prev, curr) => prev.game != curr.game,
            listener: (context, state) {
              context.read<GameLifeBloc>().add(
                    GameLifeEvent.updatePoints(
                      game: state.game!,
                      player: state.player!,
                    ),
                  );
            },
          ),
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
