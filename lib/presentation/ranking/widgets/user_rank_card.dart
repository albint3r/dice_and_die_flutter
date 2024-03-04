import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/podium/entities/user_rank.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
import '../../profile/widgets/profile_image.dart';

class UserRankCard extends StatelessWidget {
  const UserRankCard(
    this.userRank, {
    this.isFirstPlace = false,
  });

  final UserRank userRank;
  final bool isFirstPlace;

  double _getPaddingSize(bool isUser) {
    // This create the effect of size in the card for the first, and player
    // in the list of players.
    if (isFirstPlace) return 0;
    if (isUser) return padding * 2;
    return padding * 3;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    final isUser = appUser?.userId == userRank.userId;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _getPaddingSize(isUser),
      ),
      child: Card(
        color: isFirstPlace ? colorScheme.surface : colorScheme.onPrimary,
        elevation: isUser ? 12 : 0,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(padding),
                child: TitleH1(
                  text: "${userRank.ranking}",
                  color: colorScheme.onSecondary,
                ),
              ),
              const ProfileImage(
                width: 50,
                height: 50,
              ),
              const Gap(10),
              Expanded(
                child: TitleH2(
                  userRank.name,
                  // color: colorScheme.onSecondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: padding * 2,
                ),
                child: TextBody(
                  "${userRank.level}\nLvl",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  color: colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
