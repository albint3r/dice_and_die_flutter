import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/design_system/text/titleh1.dart';

class WaitingGameRoom extends StatelessWidget {
  const WaitingGameRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleH1(
            text: 'Waiting Player\nJoin Match',
            textAlign: TextAlign.center,
            color: colorScheme.onBackground,
          ),
          const Gap(20),
          const CircularProgressIndicator(),
          const Gap(15),
          CustomLongButton(
            onPressed: () => print('EStoy cancelando'),
            text: 'Cancel',
          )
        ],
      ),
    );
  }
}
