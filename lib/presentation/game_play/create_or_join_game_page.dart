import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../application/sounds_effects/sounds_effects_bloc.dart';

import '../../domain/game_play/entities/game.dart';
import '../../domain/game_play/entities/player.dart';
import '../../injectables.dart';
import 'widgets/body_game_play.dart';
import 'widgets/bottom_app_game_bar.dart';
import 'widgets/floating_action_game_play_button.dart';

@RoutePage()
class CreateOrJoinGamePage extends StatelessWidget {
  const CreateOrJoinGamePage({
    this.game,
  });

  final Game? game;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GamePlayBloc>()
            ..add(
              game is Game
                  ? GamePlayEvent.joinGame(game!)
                  : const GamePlayEvent.createGame(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<SoundsEffectsBloc>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final state = context.watch<GamePlayBloc>().state;
          final isOpponentPlayer = state.opponentPlayer is Player;
          final showBottomAppBar = isOpponentPlayer && !state.existGameError;
          return SafeArea(
            child: Scaffold(
              body: const BodyGamePlay(),
              bottomNavigationBar:
                  showBottomAppBar ? const BottomAppGameBar() : null,
              floatingActionButton: showBottomAppBar
                  ? const FloatingActionGamePlayButton()
                  : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          );
        },
      ),
    );
  }
}
