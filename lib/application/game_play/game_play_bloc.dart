import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';
import '../../domain/game2/enums/emote.dart';
import '../../domain/game2/errors/errors.dart';
import '../../domain/game2/use_case/i_game_play_facade.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';
import '../lobby/lobby_bloc.dart';

part 'game_play_bloc.freezed.dart';

part 'game_play_event.dart';

part 'game_play_state.dart';

@injectable
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc(IGamePlayFacade facade) : super(GamePlayState.initial()) {
    on<_CreateGame>((event, emit) async {
      final randomId = facade.generateRandomId();
      final channel = facade.getGamePlayChannel(randomId);
      await channel.ready;
      // Just notify the lobby it creates a new game
      final lobby = getIt<LobbyBloc>();
      lobby.add(const LobbyEvent.updateLobbyGames());
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadGamePlay(data);
          facade.listeningChatMessage(response);
          return state.copyWith(
            isLoading: false,
            game: response.game,
            player: response.game.p1,
            opponentPlayer: response.game.p2,
          );
        },
      ).whenComplete(
        () {
          final router = getIt<AppRouter>();
          try {
            channel.sink.close(status.normalClosure);
            final player = state.player;
            final game = state.game;
            final winnerPlayer = facade.getWinnerPlayer(game!, player!);
            router.replace(
              PodiumRoute(
                game: game,
                player: player,
                opponentPlayer: state.opponentPlayer!,
                winnerPlayer: winnerPlayer,
              ),
            );
          } on NoWinnerExistError catch (_) {
            emit(
              state.copyWith(
                game: null,
              ),
            );
            router.replaceAll([const LobbyRoute()]);
          }
        },
      );
    });
    on<_JoinGame>((event, emit) async {
      final channel = facade.getGamePlayChannel(event.game.gameId);
      // Just notify the lobby a new user enter to the game.
      final lobby = getIt<LobbyBloc>();
      lobby.add(const LobbyEvent.updateLobbyGames());
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadGamePlay(data);
          facade.listeningChatMessage(response);
          return state.copyWith(
            isLoading: false,
            game: response.game,
            player: response.game.p2,
            opponentPlayer: response.game.p1,
          );
        },
      ).whenComplete(
        () {
          final router = getIt<AppRouter>();
          try {
            channel.sink.close(status.normalClosure);
            final player = state.player;
            final game = state.game;
            final winnerPlayer = facade.getWinnerPlayer(game!, player!);
            router.replace(
              PodiumRoute(
                game: game,
                player: player,
                opponentPlayer: state.opponentPlayer!,
                winnerPlayer: winnerPlayer,
              ),
            );
          } on NoWinnerExistError catch (_) {
            emit(
              state.copyWith(
                game: null,
              ),
            );
            router.pop();
          }
        },
      );
    });
    on<_RollDice>((event, emit) async {
      facade.rollDice();
    });
    on<_SelectColumn>((event, emit) async {
      facade.selectColumn(event.index);
    });
    on<_GetWinnerPlayer>((event, emit) async {
      facade.getWinnerPlayer(state.game!, state.player!);
      try {
        facade.channel.closeReason;
        facade.channel.sink.close(status.normalClosure);
      } catch (e) {
        print('-*' * 100);
        print('_GetWinnerPlayer ERROR: $e');
        print('-*' * 100);
      }
      final player = state.player;
      final game = state.game;
      final winnerPlayer = facade.getWinnerPlayer(game!, player!);
      final router = getIt<AppRouter>();
      router.replace(
        PodiumRoute(
          game: game,
          player: player,
          opponentPlayer: state.opponentPlayer!,
          winnerPlayer: winnerPlayer,
        ),
      );
    });
    on<_Disconnect>((event, emit) async {
      facade.channel.closeReason;
      facade.channel.sink.close(status.normalClosure);
      await Future.delayed(
        const Duration(
          milliseconds: 1500,
        ),
      );
      getIt<LobbyBloc>().add(
        const LobbyEvent.updateLobbyGames(),
      );
    });
    on<_SendEmote>((event, emit) async {
      facade.sendEmote(event.chatEmote);
    });
  }
}
