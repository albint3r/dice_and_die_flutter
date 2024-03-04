import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import 'user_rank_card.dart';

class ListViewRank extends StatelessWidget {
  const ListViewRank({super.key});


  @override
  Widget build(BuildContext context) {
    final state = context.watch<RankingBloc>().state;
    final globalUsersRanks = state.globalUsersRanks;
    return ListView.builder(
      itemCount: globalUsersRanks.length,
      itemBuilder: (context, index) {
        final userRank = globalUsersRanks[index];
        return UserRankCard(userRank);
      },
    );
  }
}
