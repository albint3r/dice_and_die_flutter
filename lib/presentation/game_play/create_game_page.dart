import 'package:auto_route/auto_route.dart';
import 'package:dice_and_die_flutter/presentation/game_play/widgets/bottom_app_game_bar.dart';
import 'package:dice_and_die_flutter/presentation/game_play/widgets/floating_action_game_play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../injectables.dart';
import 'widgets/body_game_play.dart';

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
