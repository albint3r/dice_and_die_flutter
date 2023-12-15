import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/design_system/buttons/custom_text_button.dart';
import '../../../core/router/app_router.dart';

class GoSignInPageButton extends StatelessWidget {
  const GoSignInPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: "Don't have account? Sing up",
      onPressed: () => context.router.replaceAll([
        const SignUpRoute(),
      ]),
    );
  }
}
