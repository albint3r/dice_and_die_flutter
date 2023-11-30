import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game/game_bloc.dart';
import '../../domain/waiting_room/game.dart';
import '../../injectables.dart';
import 'widgets/body_game.dart';

@RoutePage()
class GamePage extends StatelessWidget {
  const GamePage({
    this.game,
  });

  final Game? game;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameBloc>()
        ..add(
          GameEvent.started(game),
        ),
      child: Scaffold(
        body: const BodyGame(),
        appBar: AppBar(
          title: const Text('Game Match'),
        ),
      ),
    );
  }
}
