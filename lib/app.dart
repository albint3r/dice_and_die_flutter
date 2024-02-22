import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'application/auth/auth_bloc.dart';
import 'application/waiting_room/waiting_room_bloc.dart';
import 'domain/auth/app_user.dart';
import 'injectables.dart';
import 'presentation/core/router/app_router.dart';
import 'presentation/core/router/material_app_router_delegate.dart';
import 'presentation/core/theme/const_values.dart';
import 'presentation/core/theme/theme_config.dart';

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
    return MultiBlocListener(
      listeners: [
        // This Load all the games after the user login to the App.
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (pre, curr) =>
              pre.appUser != curr.appUser &&
              curr.appUser is AppUser &&
              !curr.isAfterGame,
          listener: (context, state) => context.read<WaitingRoomBloc>().add(
                const WaitingRoomEvent.started(),
              ),
        ),
      ],
      child: ReactiveFormConfig(
        validationMessages: validationMessages,
        child: MaterialAppRouterDelegate.router(
          'Dice and Die',
          appRouter: appRouter,
          themeConfig: themeConfig,
          messengerKey: messengerKey,
          context: context,
        ),
      ),
    );
  }
}
