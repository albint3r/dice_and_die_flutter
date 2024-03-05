import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../core/theme/const_values.dart';
import 'list_view_rank.dart';
import 'user_rank_card.dart';
import 'user_ranking_information.dart';

class BodyRanking extends StatelessWidget {
  const BodyRanking({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RankingBloc>().state;
    final size = MediaQuery.of(context).size;
    final globalUsersRanks = state.globalUsersRanks;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        const UserRankingInformation(),
        const Gap(10),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(
              minWidth: minWidthBoard - 100,
              maxWidth: minWidthBoard,
            ),
            child: Column(
              children: [
                UserRankCard(
                  state.globalFirstPlaceUser!,
                  isFirstPlace: true,
                ),
                Expanded(
                  child: ListViewRank(
                    userRanking: state.userRank?.ranking ?? 0,
                    usersRanks: globalUsersRanks,
                    topN: 20,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
