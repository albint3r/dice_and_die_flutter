import 'package:dice_and_die_flutter/presentation/core/theme/theme_config.dart';
import 'package:flutter/material.dart';

import 'injectables.dart';
import 'presentation/core/router/app_router.dart';
import 'presentation/core/router/material_app_router_delegate.dart';

class App extends StatelessWidget {
  const App({
    required this.messengerKey,
    super.key,
  });

  final GlobalKey<ScaffoldMessengerState> messengerKey;

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final themeConfig = getIt<ThemeConfig>();
    return MaterialAppRouterDelegate.router(
      'Dice and Die',
      appRouter: appRouter,
      themeConfig: themeConfig,
      messengerKey: messengerKey,
      context: context,
    );
  }
}
