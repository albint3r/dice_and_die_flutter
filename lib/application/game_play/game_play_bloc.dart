import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';

part 'game_play_event.dart';
part 'game_play_state.dart';
part 'game_play_bloc.freezed.dart';

class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc() : super(GamePlayState.initial()) {
    on<_CreateGame>((event, emit) {
      // TODO: implement event handler
    });
    on<_JoinGame>((event, emit) {
      // TODO: implement event handler
    });
  }
}
