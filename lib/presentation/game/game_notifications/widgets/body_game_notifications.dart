import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../application/game_notifications/game_notifications_bloc.dart';

class BodyGameNotifications extends StatefulWidget {
  const BodyGameNotifications({super.key});

  @override
  State<BodyGameNotifications> createState() => _BodyGameNotificationsState();
}

class _BodyGameNotificationsState extends State<BodyGameNotifications>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _animationOffset = Tween<Offset>(
      begin: const Offset(-15, 0),
      end: Offset.zero,
    ).animate(_controller);
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
                'Is player turn: ${state.game?.currentPlayer?.id}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
