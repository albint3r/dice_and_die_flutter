import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/waiting_room/game.dart';
import '../../core/router/app_router.dart';

class GameTile extends StatelessWidget {
  const GameTile({required this.game, super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: game.isFull
            ? null
            : () => context.router.replace(
                  GameRoute(
                    game: game,
                  ),
                ),
        title: Text('Game id: ${game.id}'),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(game.isFull ? 'Is Full' : 'Not Full')],
        ),
      ),
    );
  }
}
