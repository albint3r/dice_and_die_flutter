import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/game2/entities/game.dart';

part 'lobby_event.dart';
part 'lobby_state.dart';
part 'lobby_bloc.freezed.dart';

@injectable
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc() : super(LobbyState.initial()) {
    on<_LoadLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
    on<_UpdateLobbyGames>((event, emit) {
      // TODO: implement event handler
    });
    on<_CreateGame>((event, emit) {
      // TODO: implement event handler
    });
    on<_JoinGame>((event, emit) {
      // TODO: implement event handler
    });
  }
}
