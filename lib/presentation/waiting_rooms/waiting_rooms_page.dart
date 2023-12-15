import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/design_system/app_bar/custom_app_bar.dart';
import 'widgets/body_waiting_rooms.dart';

@RoutePage()
class WaitingRoomsPage extends StatelessWidget {
  const WaitingRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Battle Arena',
          icon: Icons.refresh,
        ),
        body: BodyWaitingRooms(),
      ),
    );
  }
}
