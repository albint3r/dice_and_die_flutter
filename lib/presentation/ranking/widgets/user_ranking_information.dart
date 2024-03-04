import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/ranking/ranking_bloc.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
import '../../profile/widgets/profile_image.dart';

const avatarSize = 150.0;

class UserRankingInformation extends StatelessWidget {
  const UserRankingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<RankingBloc>().state;
    final size = MediaQuery.of(context).size;

    return Container(
      color: colorScheme.onSecondary,
      width: size.width,
      height: avatarSize + 50,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          children: [
            const ProfileImage(
              width: avatarSize,
              height: avatarSize,
            ),
            TitleH2('Rank: ${state.userRank?.ranking ?? 0}'),
          ],
        ),
      ),
    );
  }
}
