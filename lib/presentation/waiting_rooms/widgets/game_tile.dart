import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/waiting_room/game.dart';
import '../../core/router/app_router.dart';

class GameTile extends StatelessWidget {
  const GameTile({required this.game, super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        color: Colors.white70,
        child: ListTile(
          onTap: game.isFull
              ? null
              : () => context.router.replace(
                    GameRoute(
                      game: game,
                    ),
                  ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Game id: ${game.id.substring(0, 10)}'),
              const Divider(color: Colors.black),
              Text('P1 Score: ${game.p1.board.totalScore}'),
              Text('P2 Score: ${game.p2?.board.totalScore ?? 0}'),
            ],
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.do_not_disturb_on_total_silence,
                color: game.isFull ? Colors.red : Colors.greenAccent,
              ),
              Text(game.isFull ? 'Full' : 'Join\nGame'),
            ],
          ),
        ),
      ),
    );
  }
}
