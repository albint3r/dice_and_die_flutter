import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/lobby/entities/lobby.dart';
import '../../domain/lobby/use_case/i_lobby_facade.dart';

part 'lobby_bloc.freezed.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

@injectable
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc(ILobbyFacade facade) : super(LobbyState.initial()) {
    on<_LoadLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
    on<_UpdateLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
  }
}
