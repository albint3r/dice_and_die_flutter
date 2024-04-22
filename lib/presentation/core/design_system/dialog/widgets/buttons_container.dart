import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../application/auth/auth_bloc.dart';
import '../../../../../domain/game_play/enums/match_type.dart';
import '../../../router/app_router.dart';
import '../../../theme/const_values.dart';
import '../../buttons/custom_long_button.dart';
import '../../buttons/custom_text_button.dart';

const widthPer = .80;
const buttonPadding = 15.0;

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  BoxDecoration _boxDecoration(ColorScheme colorScheme) => BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _boxDecoration(colorScheme),
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomLongButton(
                    text: 'Play AI',
                    width: size.width * widthPer,
                    onPressed: () => context.router.push(
                      CreateOrJoinGameRoute(
                        matchType: MatchType.ai,
                      ),
                    ),
                  ),
                  const Gap(buttonPadding),
                  CustomLongButton(
                    text: 'How to Play',
                    width: size.width * widthPer,
                    onPressed: () => context.router.push(
                      const HowToPlayRoute(),
                    ),
                  ),
                  const Gap(buttonPadding),
                  CustomLongButton(
                    text: 'Profile',
                    width: size.width * widthPer,
                    onPressed: () => context.router.push(
                      const ProfileRoute(),
                    ),
                  ),
                  const Gap(buttonPadding),
                  CustomLongButton(
                    text: 'Ranking',
                    width: size.width * widthPer,
                    onPressed: () => context.router.push(
                      const RankingRoute(),
                    ),
                  ),
                ],
              ),
            ),
            CustomTextButton(
              text: 'LogOut',
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEvent.logOut(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
