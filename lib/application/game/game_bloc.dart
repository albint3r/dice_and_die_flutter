import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/game/errors.dart';
import '../../domain/game/i_game_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';
import '../waiting_room/waiting_room_bloc.dart';

part 'game_bloc.freezed.dart';

part 'game_event.dart';

part 'game_state.dart';

@injectable
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc(IGameFacade facade) : super(GameState.initial()) {
    on<_Started>((event, emit) async {
      // This Event check if the game exist. If this is true this means
      // that the [player2] provide a game id. Otherwise the app would create
      // a random id to create a new empty room.
      // Check if the Game exist
      final game = event.game;
      if (game is Game) {
        await emit.forEach(
          // Because game exist you use the game Id to join the party
          facade.getGameEvents(game.id),
          onData: (dataText) {
            try {
              final (game, player) = facade.getGameAndPlayerMatch(
                dataText as String,
                false,
              );
              return state.copyWith(
                isLoading: false,
                game: game,
                player: player,
                opponentPlayer: facade.getOpponentPlayer(player, game),
              );
            } catch (e) {
              facade.disconnectChannel();
              _leaveGame();
              throw UnExistentGameError(
                'P2 enter to a disconnect room. This websocket is no more working.',
              );
            }
          },
        );
        return;
      }
      // Because this is a new game We create a new id.
      final randomGameId = facade.generateRandomId();
      await emit.forEach(
        facade.getGameEvents(randomGameId),
        onData: (dataText) {
          final (game, player) = facade.getGameAndPlayerMatch(
            dataText as String,
            true,
          );
          return state.copyWith(
            isLoading: false,
            game: game,
            player: player,
            opponentPlayer: facade.getOpponentPlayer(player, game),
          );
        },
      );
      return;
    });
    on<_RollDice>((event, emit) {
      facade.addGameEvent('{"message": "ok"}');
    });
    on<_SelectColumn>((event, emit) {
      facade.addGameEvent('{"message": "${event.columnIndex}"}');
    });
    on<_CancelMatch>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      await facade.disconnectChannel();
      _leaveGame();
    });
  }

  void _leaveGame() {
    final router = getIt<AppRouter>();
    router.replace(const WaitingRoomsRoute());
    getIt<WaitingRoomBloc>().add(const WaitingRoomEvent.reloadEvents());
  }
}
