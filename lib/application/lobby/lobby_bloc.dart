import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';

part 'lobby_bloc.freezed.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

@singleton
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc(ILobbyFacade facade) : super(LobbyState.initial()) {
    on<_LoadLobbyGames>((event, emit) async {
      final channel = facade.getLobbyChannel();
      await channel.ready;
      emit(
        state.copyWith(
          channel: channel,
        ),
      );
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadActiveGames(data);
          return state.copyWith(
            lobby: response.lobby,
            totalPlayer: response.totalPlayers,
            isLoading: false,
          );
        },
      ).whenComplete(() async {
        // Restart All
        await _disconnect(emit);
        getIt<AppRouter>().replaceAll([const LoginRoute()]);
      });
    });
    on<_UpdateLobbyGames>(
      (event, emit) async {
        try {
          facade.updateLobbyActiveGames();
        } catch (e) {
          await _disconnect(emit);
          l.i('The users was already disconnected. This was your error: $e');
        }
      },
    );
  }

  Future<void> _disconnect(Emitter<LobbyState> emit) async {
    try {
      await state.channel?.sink.close(
        status.normalClosure,
      );
    } catch (e) {
      l.i('The users was already disconnected. This was your error: $e');
    }
    emit(
      state.copyWith(
        isLoading: true,
        totalPlayer: 0,
        channel: null,
        lobby: const Lobby(activeGames: {}),
      ),
    );
  }
}
