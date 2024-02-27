import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../application/sounds_effects/sounds_effects_bloc.dart';
import '../../domain/game2/entities/game.dart';
import '../../injectables.dart';
import 'widgets/body_game_play.dart';
import 'widgets/bottom_app_game_bar.dart';
import 'widgets/floating_action_game_play_button.dart';

@RoutePage()
class JoinGamePage extends StatelessWidget {
  const JoinGamePage({
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GamePlayBloc>()
            ..add(
              GamePlayEvent.joinGame(game),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<SoundsEffectsBloc>(),
        ),
      ],
      child: const SafeArea(
        child: Scaffold(
          body: BodyGamePlay(),
          bottomNavigationBar: BottomAppGameBar(),
          floatingActionButton: FloatingActionGamePlayButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
