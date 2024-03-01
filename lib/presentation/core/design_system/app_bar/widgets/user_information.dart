import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../application/auth/auth_bloc.dart';
import '../../../../../domain/auth/app_user.dart';
import '../../../theme/const_values.dart';
import '../../text/titleh1.dart';
import '../../text/titleh2.dart';

class UserInformation extends StatelessWidget {
  const UserInformation(this.width);

  final double width;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final user = auth.appUser;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return SizedBox(
      height: 80,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(10),
          Column(
            children: [
              TitleH1(
                text: 'Level',
                textAlign: TextAlign.center,
                fontSize: bodySmall,
                color: colorScheme.secondary,
              ),
              TitleH1(
                text: user?.userLevel.level.toString() ?? '',
                textAlign: TextAlign.center,
                fontSize: 30,
              ),
              TitleH2.isSecondary(
                user is AppUser && user.name.isNotEmpty
                    ? user.name
                    : 'Player Unknown',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
