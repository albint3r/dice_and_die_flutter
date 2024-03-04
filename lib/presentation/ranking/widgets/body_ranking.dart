import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../profile/widgets/profile_image.dart';

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
        Container(
          child: Column(
            children: [
              const ProfileImage(),
              TitleH1(text: 'Rank: ${state.userRank?.ranking ?? 0}'),
            ],
          ),
        ),
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
