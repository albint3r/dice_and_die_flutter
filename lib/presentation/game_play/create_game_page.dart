import 'package:auto_route/auto_route.dart';
import 'package:dice_and_die_flutter/presentation/game_play/widgets/body_game_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../injectables.dart';

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
        )
      ],
      child: const BodyGamePlay(),
    );
  }
}