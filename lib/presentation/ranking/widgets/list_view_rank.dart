import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../../domain/ranking/entities/user_rank.dart';
import '../../core/theme/const_values.dart';
import 'user_rank_card.dart';

class ListViewRank extends StatefulWidget {
  const ListViewRank({
    required this.userRanking,
    required this.usersRanks,
    this.tilesSpace = 2,
    this.topN = 100,
  });

  final int userRanking;
  final List<UserRank> usersRanks;
  final int tilesSpace;
  final int topN;

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
    if (ranking <= widget.topN) {
      final scrollPosition = (ranking - widget.tilesSpace).clamp(0, ranking);
      _scrollController.animateTo(
        scrollPosition * rankTileHeight,
        duration: const Duration(
          milliseconds: 700,
        ),
        curve: Curves.bounceInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.usersRanks.length,
      itemBuilder: (context, index) {
        final userRank = widget.usersRanks[index];
        return UserRankCard(userRank);
      },
    );
  }
}
