import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';
import '../../domain/game2/use_case/i_game_play_facade.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';

part 'game_play_bloc.freezed.dart';

part 'game_play_event.dart';

part 'game_play_state.dart';

@injectable
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc(IGamePlayFacade facade) : super(GamePlayState.initial()) {
    on<_CreateGame>((event, emit) async {
      final channel = facade.getGamePlayChannel();
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadGamePlay(data);
          return state.copyWith(
            isLoading: false,
            game: response.game,
            player: response.game.p1,
          );
        },
      ).whenComplete(
        () {
          channel.sink.close(status.goingAway);
          emit(
            state.copyWith(
              isLoading: true,
              game: null,
              player: null,
            ),
          );
          final router = getIt<AppRouter>();
          router.pop();
        },
      );
    });
    on<_JoinGame>((event, emit) async {
      final channel = facade.getGamePlayChannel();
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadGamePlay(data);
          return state.copyWith(
            isLoading: false,
            game: response.game,
            player: response.game.p2,
          );
        },
      ).whenComplete(
        () {
          channel.sink.close(status.goingAway);
          emit(
            state.copyWith(
              isLoading: true,
              game: null,
              player: null,
            ),
          );
          final router = getIt<AppRouter>();
          router.pop();
        },
      );
    });
  }
}
