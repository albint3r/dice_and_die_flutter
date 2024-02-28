import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'application/auth/auth_bloc.dart';
import 'application/lobby/lobby_bloc.dart';
import 'infrastructure/core/app_bloc_observer.dart';
import 'injectables.dart';

Future<void> main() async {
  await configureDependencies();
  // Create A Global Message Key to Display The Bloc observer logs in terminal
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AuthBloc>()
            ..add(
              const AuthEvent.validateInitialSessionToken(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<LobbyBloc>(),
        ),
      ],
      child: App(messengerKey: messengerKey),
    ),
  );
}
