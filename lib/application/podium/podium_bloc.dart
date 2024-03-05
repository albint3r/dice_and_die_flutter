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
      final leagueRanking = await facade.getLeagueRanking(event.rankId);
      emit(
        state.copyWith(
          isLoading: false,
          userGlobalRanking: userRanking.ranking,
          leagueRanking: leagueRanking.usersRanks,
        ),
      );
    });
  }
}
