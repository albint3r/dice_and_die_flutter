import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/router/app_router.dart';
import 'buttons_row.dart';
import 'top_indicators.dart';
import 'waiting_room_card.dart';

class BodyWaitingRooms extends StatelessWidget {
  const BodyWaitingRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    final games = state.games;
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        // CustomLongButton(
        //   text: 'Logout',
        //   onPressed: () {
        //     context.read<AuthBloc>().add(
        //           const AuthEvent.logOut(),
        //         );
        //     context.router.replaceAll([
        //       const LoginRoute(),
        //     ]);
        //   },
        // ),
        const TopIndicators(),
        // const WaitingRoomCard(),
        Expanded(
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return WaitingRoomCard(
                game: game,
              );
            },
          ),
        ),
        const ButtonsRow(),
      ],
    );
  }
}
