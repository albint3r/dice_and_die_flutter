import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../application/podium/podium_bloc.dart';
import '../../../domain/game_play/entities/player.dart';
import '../../../domain/game_play/enums/enum_game_state.dart';
import '../../../gen/assets.gen.dart';
import '../../core/theme/const_values.dart';
import '../../ranking/widgets/list_view_rank.dart';
import '../../core/design_system/animations/custom_animation_container.dart';
import 'go_back_lobby_btn.dart';
import 'user_game_final_result_info.dart';

class BodyPodiumRanking extends StatelessWidget {
  const BodyPodiumRanking({
    required this.player,
    required this.opponentPlayer,
    required this.winnerPlayer,
    required this.gameState,
    required this.backGroundImage,
    required this.textImage,
  });

  final Player player;

  final Player opponentPlayer;

  final Player winnerPlayer;
  final EnumGameState gameState;

  final ImageProvider<Object> backGroundImage;
  final Widget textImage;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PodiumBloc>().state;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        CustomAnimationContainer(
          child: UserGameFinalResultInfo(
            player: player,
            gameState: gameState,
            opponentPlayer: opponentPlayer,
            winnerPlayer: winnerPlayer,
            backGroundImage: backGroundImage,
            textImage: textImage,
          ),
        ),
        Expanded(
          child: ListViewRank(
            userRanking: state.userLeagueRanking,
            usersRanks: state.leagueRanking,
            tilesSpace: 0,
          ),
        ),
        const Gap(padding),
        GoBackLobbyBtn(
          player: player,
        ),
        const Gap(padding),
      ],
    );
  }
}
