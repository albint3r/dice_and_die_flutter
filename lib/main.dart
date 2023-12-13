import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'application/auth/auth_bloc.dart';
import 'application/waiting_room/waiting_room_bloc.dart';
import 'infrastructure/core/app_bloc_observer.dart';
import 'infrastructure/core/user_preference.dart';
import 'injectables.dart';

Future<void> main() async {
  await configureDependencies();
  // Initialize the share preference
  final pref = getIt<UserPreference>();
  await pref.init();
  final sessionToke = await pref.getSessionToken();
  // Create A Global Message Key to Display The Bloc observer logs in terminal
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              AuthEvent.started(
                sessionToken: sessionToke,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<WaitingRoomBloc>()
            ..add(
              const WaitingRoomEvent.started(),
            ),
        ),
      ],
      child: App(messengerKey: messengerKey),
    ),
  );
}
