import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/game_play/game_play_bloc.dart';
import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/design_system/text/titleh1.dart';

class WaitingGameRoom extends StatelessWidget {
  const WaitingGameRoom({
    required this.text,
    this.isButton = true,
  });

  final String text;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleH1(
            text: text,
            textAlign: TextAlign.center,
            color: colorScheme.onBackground,
          ),
          const Gap(20),
          const CircularProgressIndicator(),
          const Gap(15),
          if (isButton)
            CustomLongButton(
              onPressed: () => context.read<GamePlayBloc>().add(
                    const GamePlayEvent.disconnect(),
                  ),
              text: 'Cancel',
            ),
        ],
      ),
    );
  }
}
