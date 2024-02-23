import 'package:auto_route/auto_route.dart';
import 'package:dice_and_die_flutter/presentation/game2/widgets/body_game.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JoinGamePage extends StatelessWidget {
  const JoinGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BodyGame();
  }
}
