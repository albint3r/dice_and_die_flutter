import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';

part 'lobby_bloc.freezed.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

@injectable
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc(ILobbyFacade facade) : super(LobbyState.initial()) {
    on<_LoadLobbyGames>((event, emit) async {
      emit(
        state.copyWith(
          channel: facade.getLobbyChannel(),
        ),
      );
      await emit.forEach(
        state.channel!.stream,
        onData: (data) {
          final response = facade.loadActiveGames(data);
          return state;
        },
      ).onError((error, stackTrac) {
        print('*|' * 100);
        print('ESTA PASANDO ESTE ERROR EN LOBBY');
        print('error -> $error');
        print('stackTrac -> $stackTrac');
        print('*|' * 100);
      }).whenComplete(() {
        print('*>' * 100);
        print('ESTA PASANDO ESTE ERROR EN LOBBY');
        print('*>' * 100);
      });
    });
    on<_UpdateLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
  }
}
