import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';

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
          return state.copyWith(
            lobby: response.lobby,
            totalPlayer: response.totalPlayers,
            isLoading: false,
          );
        },
      ).onError((error, stackTrac) {
        print('*|' * 100);
        print('ESTA PASANDO ESTE ERROR EN LOBBY');
        print('error -> $error');
        print('stackTrac -> $stackTrac');
        print('*|' * 100);
      }).whenComplete(() {
        state.channel!.sink.close(status.goingAway);
        emit(
          state.copyWith(
            isLoading: true,
            totalPlayer: 0,
            channel: null,
            lobby: const Lobby(activeGames: {}),
          ),
        );
        final router = getIt<AppRouter>();
        router.pushAll(
          [
            const LoginRoute(),
          ],
        );
      });
    });
    on<_UpdateLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
  }
}
