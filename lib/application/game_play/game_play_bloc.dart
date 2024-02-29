import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../domain/game2/entities/game.dart';
import '../../domain/game2/entities/player.dart';
import '../../domain/game2/enums/emote.dart';
import '../../domain/game2/errors/errors.dart';
import '../../domain/game2/schemas/response.dart';
import '../../domain/game2/use_case/i_game_play_facade.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';
import '../lobby/lobby_bloc.dart';

part 'game_play_bloc.freezed.dart';

part 'game_play_event.dart';

part 'game_play_state.dart';

// TODO: REFACTORIZAR ESTA EN FUNCIOES MAS SIMPLES
@injectable
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc(IGamePlayFacade facade) : super(GamePlayState.initial()) {
    on<_CreateGame>((event, emit) async {
      // final randomId = facade.generateRandomId();
      final channel = facade.getGamePlayChannel('new_game');
      await channel.ready;
      // Just notify the lobby it creates a new game
      final lobby = getIt<LobbyBloc>();
      lobby.add(const LobbyEvent.updateLobbyGames());
      await emit.forEach(
        channel.stream,
        onData: (data) {
          final response = facade.loadGamePlay(data);
          final emoteExtras = facade.listeningChatMessage(response);

          if (emoteExtras is ResponseEmoteExtras &&
              emoteExtras.playerId == state.player?.id) {
            return state.copyWith(
              emoteExtrasPlayer: emoteExtras,
            );
          }
          if (emoteExtras is ResponseEmoteExtras &&
              emoteExtras.playerId == state.opponentPlayer?.id) {
            return state.copyWith(
              emoteExtrasOpponent: emoteExtras,
            );
          }
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
      try {
        print('*|'*100);
        print(state.isLoading);
        print('*|'*100);
        final channel = facade.getGamePlayChannel(event.game.gameId);
        await channel.ready;
        // Just notify the lobby a new user enter to the game.
        final lobby = getIt<LobbyBloc>();
        lobby.add(const LobbyEvent.updateLobbyGames());
        await emit.forEach(
          channel.stream,
          onData: (data) {
            final response = facade.loadGamePlay(data);
            final emoteExtras = facade.listeningChatMessage(response);
            // Send only emote if exist. This helps to avoid the dice
            // roll again and make the sound affect.
            if (emoteExtras is ResponseEmoteExtras &&
                emoteExtras.playerId == state.player?.id) {
              return state.copyWith(
                emoteExtrasPlayer: emoteExtras,
              );
            }
            if (emoteExtras is ResponseEmoteExtras &&
                emoteExtras.playerId == state.opponentPlayer?.id) {
              return state.copyWith(
                emoteExtrasOpponent: emoteExtras,
              );
            }
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
      } catch (e) {
        getIt<AppRouter>().replaceAll([const LobbyRoute()]);
      }
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
      await facade.channel.sink.close(status.normalClosure);
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
    on<_ShowEmotePlayer>((event, emit) async {
      emit(
        state.copyWith(
          isVisiblePlayerEmote: true,
        ),
      );
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(
        state.copyWith(
          isVisiblePlayerEmote: false,
        ),
      );
      await Future.delayed(
        const Duration(seconds: 1),
      );
      emit(
        state.copyWith(
          emoteExtrasPlayer: null,
        ),
      );
    });
    on<_ShowEmoteOpponent>((event, emit) async {
      emit(
        state.copyWith(
          isVisibleOpponentEmote: true,
        ),
      );
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(
        state.copyWith(
          isVisibleOpponentEmote: false,
        ),
      );
      await Future.delayed(
        const Duration(seconds: 1),
      );
      emit(
        state.copyWith(
          emoteExtrasOpponent: null,
        ),
      );
    });
  }
}
