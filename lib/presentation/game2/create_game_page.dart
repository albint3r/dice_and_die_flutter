import 'package:auto_route/auto_route.dart';
import 'package:dice_and_die_flutter/presentation/game2/widgets/body_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game2/game2_bloc.dart';
import '../../injectables.dart';

@RoutePage()
class CreateGamePage extends StatelessWidget {
  const CreateGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<Game2Bloc>()
            ..add(
              const Game2Event.joinGame(),
            ),
        ),
      ],
      child: const BodyGame(),
    );
  }
}
