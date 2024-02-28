import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/game_play/game_play_bloc.dart';
import '../../../../domain/game2/entities/player.dart';
import '../../../../domain/game2/schemas/response.dart';
import '../emote_msg_opponent.dart';
import '../first_person/turn_player_indicator.dart';
import '../game_board.dart';
import '../play_die.dart';
import '../top_life_indicator_bar.dart';
import 'opponent_columns.dart';

class SecondPersonArea extends StatelessWidget {
  const SecondPersonArea({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightWithoutBottomBar = size.height / 2;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = context.watch<GamePlayBloc>().state;
    final opponent = state.opponentPlayer;
    if (opponent is Player) {
      final columns = state.opponentPlayer!.board.columns;
      return Container(
        height: heightWithoutBottomBar,
        width: size.width,
        color: colorScheme.secondaryContainer.withOpacity(
          .2,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const TopLifeIndicatorBar(),
                Row(
                  children: [
                    // this space is to fill the empty space and have 3 columns
                    const Expanded(child: SizedBox()),
                    PlayDie(
                      number: opponent.die.currentNumber,
                      player: opponent,
                    ),
                    TurnPlayerIndicator(
                      reverse: true,
                      isTurn: state.game?.currentPlayer == opponent,
                    ),
                  ],
                ),
                GameBoard(
                  color: colorScheme.secondaryContainer,
                  player: opponent,
                  child: Row(
                    children: [
                      OpponentColumns(column: columns[1]!),
                      OpponentColumns(column: columns[2]!),
                      OpponentColumns(column: columns[3]!),
                    ],
                  ),
                ),
              ],
            ),
            if (state.emoteExtrasOpponent is ResponseEmoteExtras)
              EmoteMsgOpponent(
                state.emoteExtrasOpponent!,
              ),
          ],
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
