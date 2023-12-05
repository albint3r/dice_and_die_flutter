import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/game/i_game_facade.dart';
import '../../domain/waiting_room/game.dart';
import '../../domain/waiting_room/player.dart';

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
            final (game, player) = facade.getGameAndPlayerMatch(
              dataText as String,
              false,
            );
            return state.copyWith(
              isLoading: false,
              game: game,
              player: player,
              opponentPlayer: facade.getOpponentPlayer(player, game),
              channel: facade.channel,
            );
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
            channel: facade.channel,
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
  }
}
