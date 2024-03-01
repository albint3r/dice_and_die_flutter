import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../domain/game_play/entities/game.dart';
import '../../domain/game_play/entities/player.dart';
import '../../domain/game_play/enums/emote.dart';
import '../../domain/game_play/errors/errors.dart';
import '../../domain/game_play/schemas/response.dart';
import '../../domain/game_play/use_case/i_game_play_facade.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';
import '../lobby/lobby_bloc.dart';

part 'game_play_bloc.freezed.dart';

part 'game_play_event.dart';

part 'game_play_state.dart';

@injectable
class GamePlayBloc extends Bloc<GamePlayEvent, GamePlayState> {
  GamePlayBloc(IGamePlayFacade facade) : super(GamePlayState.initial()) {
    on<_CreateOrJoinGame>((event, emit) async {
      try {
        final eGame = event.game;
        final channel = facade.getGamePlayChannel(
          eGame is Game ? eGame.gameId : 'new_game',
        );
        await channel.ready;
        // Just notify the lobby user creates a new game
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
              player: eGame is Game ? response.game.p2 : response.game.p1,
              opponentPlayer:
                  eGame is Game ? response.game.p1 : response.game.p2,
            );
          },
        ).whenComplete(
          () {
            try {
              _getWinnerPlayer(facade);
            } on NoWinnerExistError catch (_) {
              emit(
                state.copyWith(
                  game: null,
                ),
              );
              getIt<AppRouter>().replaceAll([
                const LobbyRoute(),
              ]);
            }
          },
        );
      } catch (e) {
        // This error is related usually when the user is trying
        // to connect to a game corps.
        emit(
          state.copyWith(
            existGameError: true,
          ),
        );
        await Future.delayed(
          const Duration(seconds: 3),
        );
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
      _getWinnerPlayer(facade);
    });
    on<_SendEmote>((event, emit) async {
      facade.sendEmote(event.chatEmote);
    });
    on<_Disconnect>((event, emit) async {
      facade.channel.closeReason;
      await facade.channel.sink.close(
        status.normalClosure,
      );
      getIt<LobbyBloc>().add(
        const LobbyEvent.updateLobbyGames(),
      );
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

  void _getWinnerPlayer(IGamePlayFacade facade) {
    facade.channel.closeReason;
    facade.channel.sink.close(status.normalClosure);
    final player = state.player;
    final game = state.game;
    final winnerPlayer = facade.getWinnerPlayer(game!, player!);
    final router = getIt<AppRouter>();
    // Send user to the podium screen
    router.replace(
      PodiumRoute(
        game: game,
        player: player,
        opponentPlayer: state.opponentPlayer!,
        winnerPlayer: winnerPlayer,
      ),
    );
  }
}
