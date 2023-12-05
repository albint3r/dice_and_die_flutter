import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/game_state.dart';

part 'game_notifications_bloc.freezed.dart';
part 'game_notifications_event.dart';
part 'game_notifications_state.dart';

@injectable
class GameNotificationsBloc
    extends Bloc<GameNotificationsEvent, GameNotificationsState> {
  GameNotificationsBloc() : super(GameNotificationsState.initial()) {
    on<_Update>((event, emit) {
      final game = event.game;
      if (game.state == GameAppState.rollDice) {
        emit(
          state.copyWith(
            showNotifications: true,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          showNotifications: false,
        ),
      );
    });
  }
}
