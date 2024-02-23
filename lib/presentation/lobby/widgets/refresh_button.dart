import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/lobby/lobby_bloc.dart';
import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShortButton(
      icon: Icons.refresh,
      onPressed: () => context.read<LobbyBloc>().add(
            const LobbyEvent.updateLobbyGames(),
          ),
    );
  }
}
