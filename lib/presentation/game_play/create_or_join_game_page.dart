import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/game_play/game_play_bloc.dart';
import '../../application/sounds_effects/sounds_effects_bloc.dart';

import '../../domain/game_play/entities/game.dart';
import '../../domain/game_play/entities/player.dart';
import '../../domain/game_play/enums/enum_game_state.dart';
import '../../domain/game_play/schemas/response.dart';
import '../../injectables.dart';
import 'widgets/body_game_play.dart';
import 'widgets/bottom_app_game_bar.dart';
import 'widgets/floating_action_game_play_button.dart';

@RoutePage()
class CreateOrJoinGamePage extends StatelessWidget {
  const CreateOrJoinGamePage({
    this.game,
  });

  final Game? game;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GamePlayBloc>()
            ..add(
              GamePlayEvent.createOrJoinGame(game),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<SoundsEffectsBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GamePlayBloc, GamePlayState>(
            listenWhen: (pre, curr) {
              return pre.game?.gameState != curr.game?.gameState &&
                  curr.game?.gameState == EnumGameState.rollDice;
            },
            listener: (context, state) => context.read<SoundsEffectsBloc>().add(
                  const SoundsEffectsEvent.playRollDice(),
                ),
          ),
          BlocListener<GamePlayBloc, GamePlayState>(
            listenWhen: (pre, curr) =>
            pre.game?.winnerPlayer != curr.game?.winnerPlayer &&
                curr.game?.winnerPlayer is List<Player?>,
            listener: (context, state) => context.read<GamePlayBloc>().add(
              const GamePlayEvent.getWinnerPlayer(),
            ),
          ),
          BlocListener<GamePlayBloc, GamePlayState>(
            listenWhen: (pre, curr) =>
            pre.game?.gameState != curr.game?.gameState &&
                curr.game?.gameState == EnumGameState.selectColumn,
            listener: (context, state) => context.read<SoundsEffectsBloc>().add(
              const SoundsEffectsEvent.stopRollDice(),
            ),
          ),
          BlocListener<SoundsEffectsBloc, SoundsEffectsState>(
            listenWhen: (pre, curr) =>
            pre.isRollDiceSoundComplete != curr.isRollDiceSoundComplete &&
                curr.isRollDiceSoundComplete,
            listener: (context, state) => context.read<GamePlayBloc>().add(
              const GamePlayEvent.rollDice(),
            ),
          ),
          BlocListener<GamePlayBloc, GamePlayState>(
            listenWhen: (pre, curr) =>
            pre.emoteExtrasPlayer != curr.emoteExtrasPlayer &&
                curr.emoteExtrasPlayer is ResponseEmoteExtras &&
                !curr.isVisiblePlayerEmote,
            listener: (context, state) => context.read<GamePlayBloc>().add(
              const GamePlayEvent.showEmotePlayer(),
            ),
          ),
          BlocListener<GamePlayBloc, GamePlayState>(
            listenWhen: (pre, curr) =>
            pre.emoteExtrasOpponent != curr.emoteExtrasOpponent &&
                curr.emoteExtrasOpponent is ResponseEmoteExtras &&
                !curr.isVisibleOpponentEmote,
            listener: (context, state) => context.read<GamePlayBloc>().add(
              const GamePlayEvent.showEmoteOpponent(),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            final state = context.watch<GamePlayBloc>().state;
            final isOpponentPlayer = state.opponentPlayer is Player;
            final showBottomAppBar = isOpponentPlayer && !state.existGameError;
            return SafeArea(
              child: Scaffold(
                body: const BodyGamePlay(),
                bottomNavigationBar:
                    showBottomAppBar ? const BottomAppGameBar() : null,
                floatingActionButton: showBottomAppBar
                    ? const FloatingActionGamePlayButton()
                    : null,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              ),
            );
          },
        ),
      ),
    );
  }
}
