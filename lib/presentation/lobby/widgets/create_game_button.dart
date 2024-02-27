import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/const_values.dart';

class CreateGameButton extends StatelessWidget {
  const CreateGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomLongButton(
      text: 'Create Game',
      width: size.width - (shortButtonWidth + padding + 5),
      onPressed: () => context.router.push(
        const CreateGameRoute(),
      ),
    );
  }
}
