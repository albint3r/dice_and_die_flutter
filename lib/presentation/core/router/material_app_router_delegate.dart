import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class MaterialAppRouterDelegate {
  static MaterialApp router(
    String title, {
    required RootStackRouter appRouter,
    required GlobalKey<ScaffoldMessengerState> messengerKey,
    required BuildContext context,
  }) {
    return MaterialApp.router(
      // Disables the debug banner in release builds.
      debugShowCheckedModeBanner: false,
      // Sets the scaffoldMessengerKey to the provided GlobalKey.
      scaffoldMessengerKey: messengerKey,
      // Sets the default theme mode to dark.
      themeMode: ThemeMode.dark,
      // Sets the title of the app.
      title: title,
      // Configures the router with the provided appRouter.config().
      routerConfig: appRouter.config(),
    );
  }
}
