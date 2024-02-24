import 'package:bloc/bloc.dart';
import 'package:dice_and_die_flutter/domain/game2/use_case/i_game_play_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';

part 'game_play_event.dart';

part 'game_play_state.dart';

part 'game_play_bloc.freezed.dart';

@injectable
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc(IGamePlayFacade facade) : super(GamePlayState.initial()) {
    on<_CreateGame>((event, emit) async {
      final channel = facade.getGamePlayChannel();
      await emit.forEach(
        channel.stream,
        onData: (data) {
          facade.loadGamePlay(data);
          return state;
        },
      );
    });
    on<_JoinGame>((event, emit) {
      // TODO: implement event handler
    });
  }
}
