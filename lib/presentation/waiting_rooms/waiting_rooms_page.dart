import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/body_waiting_rooms.dart';

@RoutePage()
class WaitingRoomsPage extends StatelessWidget {
  const WaitingRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyWaitingRooms(),
      ),
    );
  }
}
