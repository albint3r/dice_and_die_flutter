import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../domain/podium/entities/user_rank.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
import '../../profile/widgets/profile_image.dart';

class UserRankCard extends StatelessWidget {
  const UserRankCard(
    this.userRank,
  );

  final UserRank userRank;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding * 2),
      child: Card(
        color: colorScheme.onPrimary,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 75,
          ),
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
                padding: const EdgeInsets.all(padding),
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
