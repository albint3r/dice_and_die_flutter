import 'package:flutter/material.dart';

import '../../../domain/auth/app_user.dart';
import '../../core/design_system/text/titleh2.dart';

class RankInfo extends StatelessWidget {
  const RankInfo(this.appUser);

  final AppUser appUser;

  @override
  Widget build(BuildContext context) {
    return TitleH2('Rank: ${appUser.userLevel.rank.name}');
  }
}
