import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/ranking/ranking_bloc.dart';
import 'list_view_rank.dart';
import 'user_rank_card.dart';
import 'user_ranking_information.dart';

class BodyRanking extends StatelessWidget {
  const BodyRanking({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RankingBloc>().state;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        const UserRankingInformation(),
        const Gap(10),
        UserRankCard(
          state.globalFirstPlaceUser!,
          isFirstPlace: true,
        ),
        const Expanded(
          child: ListViewRank(),
        ),
      ],
    );
  }
}
