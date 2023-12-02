import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class TopIndicators extends StatelessWidget {
  const TopIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    final games = state.games;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onPrimaryColor = colorScheme.onPrimary;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                color: onPrimaryColor,
              ),
              const Gap(5),
              TitleH2.isSecondary(
                'Players: ${state.connectedPlayers}',
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.casino,
                color: onPrimaryColor,
              ),
              const Gap(5),
              TitleH2.isSecondary(
                'Games: ${games.length}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
