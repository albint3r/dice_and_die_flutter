import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../domain/auth/app_user.dart';
import '../../../theme/const_values.dart';
import '../../text/titleh1.dart';
import '../../text/titleh2.dart';

class UserLevelProgressBarPodium extends StatelessWidget {
  const UserLevelProgressBarPodium(this.appUser);

  final AppUser appUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: 300,
      child: LinearPercentIndicator(
        animationDuration: 3500,
        animation: true,
        curve: Curves.bounceOut,
        width: 250,
        lineHeight: progressBarHeight,
        percent:
            appUser.userLevel.expPoints / appUser.userLevel.nextLevelPoints,
        alignment: MainAxisAlignment.center,
        barRadius: const Radius.circular(borderRadius),
        backgroundColor: colorScheme.onSecondary,
        progressColor: colorScheme.inversePrimary,
        center: TitleH2.isSecondary("lvl: ${appUser.userLevel.level}"),
        leading: TitleH1(
          text: '${appUser.userLevel.expPoints}',
          color: colorScheme.onSecondary,
          fontSize: 10,
        ),
        trailing: TitleH1(
          text: '${appUser.userLevel.nextLevelPoints}',
          color: colorScheme.onSecondary,
          fontSize: 10,
        ),
      ),
    );
  }
}
