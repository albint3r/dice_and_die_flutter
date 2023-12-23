import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/theme/const_values.dart';
import 'profile_image.dart';
import 'user_account_information.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Gap(30),
          ProfileImage(),
          Gap(padding),
          UserAccountInformation(),
        ],
      ),
    );
  }
}
