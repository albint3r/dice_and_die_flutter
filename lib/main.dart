import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'infrastructure/core/app_bloc_observer.dart';
import 'injectables.dart';

Future<void> main() async {
  await configureDependencies();
  // Create A Global Message Key to Display The Bloc observer logs in terminal
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = AppBlocObserver(messengerKey);
  runApp(App(messengerKey: messengerKey));
}
