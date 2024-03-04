import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/podium/podium_bloc.dart';
import '../core/design_system/text/titleh1.dart';

class YourRankInfoCard extends StatelessWidget {
  const YourRankInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<PodiumBloc>().state;
    return Card(
      color: Colors.white,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleH1(
              text: 'Your Are Ranking: ${state.userGlobalRanking}',
              color: colorScheme.onSecondary,
            ),
            // TitleH2(
            //   'Rank ${player.appUser.userLevel.rank.name}: ${state.userRankRanking}',
            // ),
          ],
        ),
      ),
    );
  }
}
