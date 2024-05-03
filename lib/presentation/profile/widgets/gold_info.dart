import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/core/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../core/design_system/text/titleh1.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class GoldInfo extends StatelessWidget {
  const GoldInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final bank = auth.appUser?.bankAccount;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.monetface.image(),
        const TitleH2('Gold:'),
        const Gap(padding),
        TitleH1(
          text: bank!.amount.toString().formatToFinancial(
                isMoneySymbol: true,
              ),
          color: colorScheme.onBackground,
          fontSize: 30.0,
        ),
      ],
    );
  }
}
