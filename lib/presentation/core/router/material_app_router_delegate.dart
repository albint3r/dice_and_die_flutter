import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../theme/theme_config.dart';
import 'app_router.dart';

class MaterialAppRouterDelegate {
  static MaterialApp router(
    String title, {
    required RootStackRouter appRouter,
    required ThemeConfig themeConfig,
    required GlobalKey<ScaffoldMessengerState> messengerKey,
    required BuildContext context,
  }) {
    return MaterialApp.router(
      // Disables the debug banner in release builds.
      debugShowCheckedModeBanner: false,
      // Sets the scaffoldMessengerKey to the provided GlobalKey.
      scaffoldMessengerKey: messengerKey,
      // Sets the light theme for the app using themeConfigStyle.light.
      theme: themeConfig.light,
      // Sets the dark theme for the app using themeConfigStyle.dark.
      darkTheme: themeConfig.dark,
      // Sets the default theme mode to dark.
      themeMode: ThemeMode.light,
      // Sets the title of the app.
      title: title,
      // Configures the router with the provided appRouter.config().
      routerConfig: appRouter.config(
        deepLinkBuilder: (deepLink) {
          final isGameFriend = deepLink.path.startsWith('/game-friend');
          final auth = context.watch<AuthBloc>().state;
          print('*-' * 100);
          print('DeepLink ->$deepLink');
          print('initial ->${deepLink.initial}');
          print('uri ->${deepLink.uri}');
          print('configuration ->${deepLink.configuration}');
          print('defaultPath ->${DeepLink.defaultPath}');
          print('sessionToken ->${auth.sessionToken}');
          print('auth ->${auth.appUser}');
          print('startsWith ->$isGameFriend');
          print('*-' * 100);
          if (isGameFriend) {
            final gameId = deepLink.path.split('/').last;
            return DeepLink(
              [
                ChallengeFriendRoute(
                  gameId: gameId,
                ),
              ],
            );
          } else {
            return DeepLink.defaultPath;
            // or DeepLink.path('/')
            // or DeepLink([HomeRoute()])
          }
        },
      ),
    );
  }
}
