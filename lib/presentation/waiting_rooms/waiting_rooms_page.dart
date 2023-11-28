import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/waiting_room/waiting_room_bloc.dart';
import '../../injectables.dart';
import 'widgets/body_waiting_rooms.dart';

@RoutePage()
class WaitingRoomsPage extends StatelessWidget {
  const WaitingRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WaitingRoomBloc>()
        ..add(
          const WaitingRoomEvent.started(),
        ),
      child: Scaffold(
        body: const BodyWaitingRooms(),
        appBar: AppBar(
          title: const Text('Waiting Room'),
        ),
      ),
    );
  }
}
