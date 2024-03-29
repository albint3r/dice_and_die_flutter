import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/podium/use_cases/i_podium_facade.dart';
import '../../domain/ranking/entities/user_rank.dart';

part 'podium_bloc.freezed.dart';

part 'podium_event.dart';

part 'podium_state.dart';

@injectable
class PodiumBloc extends Bloc<PodiumEvent, PodiumState> {
  PodiumBloc(IPodiumFacade facade) : super(PodiumState.initial()) {
    on<_Started>((event, emit) async {
      final userRanking = await facade.getUserGlobalRanking();
      final userLeagueRanking = await facade.getUserLeagueRanking(event.rankId);
      final leagueRanking = await facade.getLeagueRanking(event.rankId);
      emit(
        state.copyWith(
          isLoading: false,
          userGlobalRanking: userRanking.ranking,
          userLeagueRanking: userLeagueRanking.ranking,
          leagueRanking: leagueRanking.usersRanks,
        ),
      );
    });
    on<_PlayWinSound>((event, emit) async {
      const path = 'sounds/win_sound.mp3';
      await state.winSound.setSource(
        AssetSource(path),
      );
      await state.winSound.resume();
    });

    on<_PlayLoseSound>((event, emit) async {
      const path = 'sounds/lose_sound.mp3';
      await state.loseSound.setSource(
        AssetSource(path),
      );
      await state.loseSound.resume();
    });
  }
}
