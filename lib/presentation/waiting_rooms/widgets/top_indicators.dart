import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/theme/const_values.dart';

class TopIndicators extends StatelessWidget {
  const TopIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WaitingRoomBloc>().state;
    final games = state.games;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onBackground = colorScheme.onBackground;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.people,
                color: onBackground,
              ),
              const Gap(5),
              TitleH1(
                text: 'Players: ${state.connectedPlayers}',
                color: onBackground,
                fontSize: h2,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.casino,
                color: onBackground,
              ),
              const Gap(5),
              TitleH1(
                text: 'Games: ${games.length}',
                color: onBackground,
                fontSize: h2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
