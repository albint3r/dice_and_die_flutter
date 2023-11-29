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
            print('-2' * 100);
            print('Player 2 loop');

            // Convert Data in Json
            final Json data = jsonDecode(dataText as String) as Json;
            print('data-> $data');
            // Get Game Update
            Game? game;
            final Json match = jsonDecode(data['match'] as String) as Json;
            game = Game.fromJson(match);
            print('game->$game');
            print('-2' * 100);
            return state.copyWith(
              isLoading: false,
              game: game,
              player: game.p2,
              channel: facade.channel,
            );
          },
        );
        return;
      }
      // Because this is a new game We create a new id.
      final randomGameId = facade.generateRandomId();
      await emit.forEach(
        // todo: replace 007 by the randomGameId
        facade.getGameEvents('007'),
        onData: (dataText) {
          print('-1' * 100);
          print('Player 1 loop');
          print('-1' * 100);
          // Convert Data in Json
          final Json data = jsonDecode(dataText as String) as Json;
          // Get Game Update
          Game? game;
          final Json match = jsonDecode(data['match'] as String) as Json;
          game = Game.fromJson(match);
          return state.copyWith(
            isLoading: false,
            game: game,
            player: game.p1,
            channel: facade.channel,
          );
        },
      );
      return;
    });
    on<_RollDice>((event, emit) async {
      print('*-' * 100);
      print('_RollDice');
      final channel = state.channel;
      print('chanel-> $channel');
      if (channel != null) {
        channel.sink.add('{"message": "ok"}');
        print('8->' * 100);
      }
      print('*-' * 100);
    });
    on<_SelectColumn>((event, emit) async {
      print('*-' * 100);
      print('_SelectColumn');
      final channel = state.channel;
      print('chanel-> $channel');
      if (channel != null) {
        channel.sink.add('{"message": "${event.columnIndex}"}');
        print('8->' * 100);
      }
      print('*-' * 100);
    });
  }
}
