import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/design_system/text/titleh1.dart';
import '../../core/theme/const_values.dart';
import 'account_name_field.dart';

class UserAccountInformation extends StatelessWidget {
  const UserAccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      width: waitingRoomCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(padding),
          const TitleH1(text: 'User Information'),
          Divider(color: colorScheme.onBackground),
          const AccountNameField(),
        ],
      ),
    );
  }
}
