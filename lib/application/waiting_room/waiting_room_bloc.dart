import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/i_waiting_room_facade.dart';

part 'waiting_room_bloc.freezed.dart';

part 'waiting_room_event.dart';

part 'waiting_room_state.dart';

@singleton
class WaitingRoomBloc extends Bloc<WaitingRoomEvent, WaitingRoomState> {
  WaitingRoomBloc(IWaitingRoomDFacade facade)
      : super(WaitingRoomState.initial()) {
    on<_Started>((event, emit) async {
      // Add WebSocket events
      await emit.forEach(
        facade.getWaitingRoomsEvents(
          await facade.pref.getSessionToken(),
        ),
        onData: (dataText) {
          // Add Games and Active user information in the waiting room
          final (games, connectedPlayers) = facade.getGamesAndActiveUsers(
            dataText as String,
          );
          return state.copyWith(
            isLoading: false,
            games: games,
            connectedPlayers: connectedPlayers,
            channel: facade.channel,
          );
        },
      ).onError((error, stackTrace) async {
        // Todo: Add error to create a listener that kill the project
        await facade.pref.deleteSessionToken();
        print('*-1' * 100);
        print(error);
        print('*-1' * 100);
      });
    });
    on<_ReloadEvents>((event, emit) async {
      facade.addWaitingRoomsEvent('{"message": "reload_event"}');
    });
    on<_GoGame>((event, emit) async {
      facade.addWaitingRoomsEvent('{"message": "go_game"}');
    });
  }
}
