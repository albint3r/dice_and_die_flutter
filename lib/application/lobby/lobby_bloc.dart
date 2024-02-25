import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';
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
      ).whenComplete(() {
        // Restart All
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
      }).onError((error, stackTrace) {
        print('*-'*100);
        print('error->$error');
        print('*-'*100);
      });
    });
    on<_UpdateLobbyGames>(
      (event, emit) => facade.updateLobbyActiveGames(),
    );
  }
}
