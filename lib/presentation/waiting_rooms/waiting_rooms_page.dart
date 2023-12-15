import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/waiting_room/waiting_room_bloc.dart';
import '../core/design_system/app_bar/custom_app_bar.dart';
import 'widgets/body_waiting_rooms.dart';

@RoutePage()
class WaitingRoomsPage extends StatelessWidget {
  const WaitingRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Battle Arena',
          icon: Icons.refresh,
          onPress: () => context.read<WaitingRoomBloc>().add(
                const WaitingRoomEvent.reloadEvents(),
              ),
        ),
        body: const BodyWaitingRooms(),
      ),
    );
  }
}
