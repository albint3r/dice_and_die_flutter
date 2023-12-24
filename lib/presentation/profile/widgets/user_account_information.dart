import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
import 'account_name_field.dart';

class UserAccountInformation extends StatelessWidget {
  const UserAccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final auth = context.watch<AuthBloc>().state;
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(padding),
          const TitleH1(text:'User Information'),
          Divider(color: colorScheme.onBackground),
          const AccountNameField(),
          const Gap(padding),
          const TitleH2('Joined:'),
          TitleH2(auth.appUser?.creationDate.toString() ?? ''),
        ],
      ),
    );
  }
}
