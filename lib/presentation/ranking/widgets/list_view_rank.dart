import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import 'user_rank_card.dart';

class ListViewRank extends StatefulWidget {
  const ListViewRank({
    required this.userRanking,
  });

  final int userRanking;

  @override
  State<ListViewRank> createState() => _ListViewRankState();
}

class _ListViewRankState extends State<ListViewRank> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToUserRank(
        widget.userRanking,
      ),
    );
  }

  void _scrollToUserRank(int ranking) {
    if (ranking <= 20) {
      _scrollController.jumpTo(
        (ranking - 2).clamp(0, ranking) * 75,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RankingBloc>().state;
    final globalUsersRanks = state.globalUsersRanks;

    return ListView.builder(
      controller: _scrollController,
      itemCount: globalUsersRanks.length,
      itemBuilder: (context, index) {
        final userRank = globalUsersRanks[index];
        return UserRankCard(userRank);
      },
    );
  }
}
