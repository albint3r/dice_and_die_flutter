import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../profile/widgets/profile_image.dart';
import 'user_ranking_information.dart';

class BodyRanking extends StatelessWidget {
  const BodyRanking({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RankingBloc>().state;
    final globalUsersRanks = state.globalUsersRanks;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        UserRankingInformation(),
        Expanded(
          child: ListView.builder(
            itemCount: globalUsersRanks.length,
            itemBuilder: (context, index) {
              final userRank = globalUsersRanks[index];
              return Card(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextBody("${userRank.ranking}"),
                      TextBody(userRank.name),
                      TextBody("${userRank.level}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
