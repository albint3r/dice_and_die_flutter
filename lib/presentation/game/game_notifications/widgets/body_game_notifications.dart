import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game/game_bloc.dart';
import '../../../../application/game_notifications/game_notifications_bloc.dart';
import '../../../../domain/waiting_room/game.dart';
import '../../../../domain/waiting_room/player.dart';
import '../../../core/design_system/text/titleh1.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getPlayerTurnNotification(
    Player player,
    Game game,
    ColorScheme colorScheme,
  ) {
    final String text;
    final Color color;
    if (player.id == game.currentPlayer!.id) {
      text = 'Your Turn';
      color = colorScheme.primaryContainer;
    } else {
      text = 'Opponent Turn';
      color = colorScheme.secondaryContainer;
    }
    return TitleH1(
      text: text,
      color: color,
      fontSize: 35,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameNotification = context.watch<GameNotificationsBloc>().state;
    final state = context.watch<GameBloc>().state;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    if (!gameNotification.showNotifications) {
      _controller.reset();
      return const SizedBox.shrink();
    }

    _controller.forward();
    return SlideTransition(
      position: _animationOffset,
      child: Center(
        child: getPlayerTurnNotification(
          state.player!,
          state.game!,
          colorScheme,
        ),
      ),
    );
  }
}
