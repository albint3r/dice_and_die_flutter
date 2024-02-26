import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../domain/game2/entities/player.dart';
import '../../injectables.dart';
import 'widgets/body_game_play.dart';
import 'widgets/bottom_app_game_bar.dart';
import 'widgets/floating_action_game_play_button.dart';

@RoutePage()
class CreateGamePage extends StatelessWidget {
  const CreateGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GamePlayBloc>()
            ..add(
              const GamePlayEvent.createGame(),
            ),
        ),
      ],
      child: Builder(
        builder: (context) {
          final state = context.watch<GamePlayBloc>().state;
          final isOpponentPlayer = state.opponentPlayer is Player;
          return SafeArea(
            child: Scaffold(
              body: const BodyGamePlay(),
              bottomNavigationBar:
                  isOpponentPlayer ? const BottomAppGameBar() : null,
              floatingActionButton: isOpponentPlayer
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
