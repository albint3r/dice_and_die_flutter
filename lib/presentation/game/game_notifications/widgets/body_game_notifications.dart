import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../application/game_notifications/game_notifications_bloc.dart';
import '../../../../domain/waiting_room/game.dart';
import '../../../../domain/waiting_room/player.dart';

class BodyGameNotifications extends StatefulWidget {
  const BodyGameNotifications({super.key});

  @override
  State<BodyGameNotifications> createState() => _BodyGameNotificationsState();
}

class _BodyGameNotificationsState extends State<BodyGameNotifications>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationOffset;
  late CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animationOffset = Tween<Offset>(
      begin: const Offset(-10, 0),
      end: Offset.zero,
    ).animate(_curve);

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 2));
        _controller.reverse();
      }
    });
  }

  String getPlayerTurnNotification(
    Player player,
    Game game,
  ) {
    if (player.id == game.currentPlayer!.id) {
      return 'Is your turn: ${player.id.substring(0, 5)}';
    }
    return 'Is Opponent turn: ${game.currentPlayer!.id.substring(0, 5)}';
  }

  @override
  Widget build(BuildContext context) {
    final gameNotification = context.watch<GameNotificationsBloc>().state;
    final state = context.watch<GameBloc>().state;
    if (!gameNotification.showNotifications) {
      _controller.reset();
      return const SizedBox.shrink();
    }

    _controller.forward();
    return SlideTransition(
      position: _animationOffset,
      child: Center(
        child: ColoredBox(
          color: Colors.red,
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text(
                getPlayerTurnNotification(
                  state.player!,
                  state.game!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
