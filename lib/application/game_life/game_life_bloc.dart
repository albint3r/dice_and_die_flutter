import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/game_life/i_game_life_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';

part 'game_life_event.dart';

part 'game_life_state.dart';

part 'game_life_bloc.freezed.dart';

@injectable
class GameLifeBloc extends Bloc<GameLifeEvent, GameLifeState> {
  GameLifeBloc(IGameLifeFacade facade) : super(GameLifeState.initial()) {
    on<_UpdatePoints>((event, emit) {
      final game = event.game;
      final player = event.player;
      emit(
        state.copyWith(
          game: game,
          player: player,
          opponentPlayer: facade.getOpponentPlayer(
            game,
            player,
          ),
        ),
      );
    });
  }
}
