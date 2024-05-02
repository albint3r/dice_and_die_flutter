import 'package:dice_and_die_flutter/presentation/profile/widgets/referrals_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../core/design_system/app_bar/widgets/user_level_progress_bar_podium.dart';
import '../../core/theme/const_values.dart';
import 'profile_image.dart';
import 'rank_info.dart';
import 'user_account_information.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    return Center(
      child: ListView(
        children: [
          Column(
            children: [
              const Gap(padding * 3),
              const ProfileImage(),
              const Gap(padding * 3),
              UserLevelProgressBarPodium(appUser!),
              RankInfo(appUser),
              const Gap(padding * 3),
              const UserAccountInformation(),
              const ReferralsTable(),
            ],
          ),
        ],
      ),
    );
  }
}
