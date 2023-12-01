import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/core/types.dart';
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
      // Check if the Game exist
      final game = event.game;
      if (game is Game) {
        await emit.forEach(
          // Because game exist you use the game Id to join the party
          facade.getGameEvents(game.id),
          onData: (dataText) {
            // Convert Data in Json
            final Json data = jsonDecode(dataText as String) as Json;
            // Get Game Update
            Game? game;
            final Json match = jsonDecode(data['match'] as String) as Json;
            game = Game.fromJson(match);
            print('*-' * 100);
            print(game);
            print('*-' * 100);
            final player = game.p2;
            return state.copyWith(
              isLoading: false,
              game: game,
              player: player,
              opponentPlayer: facade.getOpponentPlayer(player, game),
              channel: facade.channel,
            );
          },
        ).whenComplete(() {
          print('*-'*100);
          print('whenComplete');
          print('*-'*100);
        }).onError((error, stackTrace) {
          print('*-'*100);
          print('onError');
          print('*-'*100);
        });
        return;
      }
      // Because this is a new game We create a new id.
      final randomGameId = facade.generateRandomId();
      await emit.forEach(
        facade.getGameEvents(randomGameId),
        onData: (dataText) {
          // Convert Data in Json
          final Json data = jsonDecode(dataText as String) as Json;
          // Get Game Update
          Game? game;
          final Json match = jsonDecode(data['match'] as String) as Json;
          game = Game.fromJson(match);
          final player = game.p1;
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
    on<_RollDice>((event, emit) async {
      final channel = state.channel;
      if (channel != null) {
        channel.sink.add('{"message": "ok"}');
      }
    });
    on<_SelectColumn>((event, emit) async {
      final channel = state.channel;
      if (channel != null) {
        channel.sink.add('{"message": "${event.columnIndex}"}');
      }
    });
  }
}
