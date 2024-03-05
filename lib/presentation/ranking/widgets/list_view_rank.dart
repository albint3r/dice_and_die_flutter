import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../core/theme/const_values.dart';
import 'user_rank_card.dart';

const topN = 20;
const defaultTilesSpace = 2;

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
    if (ranking <= topN) {
      final scrollPosition = (ranking - defaultTilesSpace).clamp(0, ranking);
      _scrollController.animateTo(
        scrollPosition * rankTileHeight,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut,
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
