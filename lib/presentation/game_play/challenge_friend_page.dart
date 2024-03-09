import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChallengeFriendPage extends StatelessWidget {
  const ChallengeFriendPage({@PathParam('id') required this.gameId});

  final String gameId;

  @override
  Widget build(BuildContext context) {
    print('*-' * 100);
    print('gameId->$gameId');
    print('*-' * 100);
    return const Placeholder();
  }
}
