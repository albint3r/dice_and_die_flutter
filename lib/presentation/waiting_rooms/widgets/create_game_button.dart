import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/router/app_router.dart';

class CreateGameButton extends StatelessWidget {
  const CreateGameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLongButton(
      text: 'Create Game',
      width: 300,
      onPressed: () => context.router.replace(
        GameRoute(),
      ),
    );
  }
}
