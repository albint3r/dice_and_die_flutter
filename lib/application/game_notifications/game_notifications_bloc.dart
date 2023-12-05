import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/waiting_room/game_state.dart';

part 'game_notifications_event.dart';

part 'game_notifications_state.dart';

part 'game_notifications_bloc.freezed.dart';

@injectable
class GameNotificationsBloc
    extends Bloc<GameNotificationsEvent, GameNotificationsState> {
  GameNotificationsBloc() : super(GameNotificationsState.initial()) {
    on<_Started>((event, emit) {
      // TODO: implement event handler
    });
  }
}
