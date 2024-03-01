import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/podium/use_cases/i_podium_facade.dart';

part 'podium_bloc.freezed.dart';

part 'podium_event.dart';

part 'podium_state.dart';

@injectable
class PodiumBloc extends Bloc<PodiumEvent, PodiumState> {
  PodiumBloc(IPodiumFacade facade) : super(PodiumState.initial()) {
    on<_Started>((event, emit) async {
      final userRanking = await facade.getUserRanking();
      final usersRankings = await facade.getUsersRanking();
      final usersRankingByRank = await facade.getUserRankingByRank(
        event.rankId,
      );
      final usersRankingsByRank = await facade.getUsersRankingByRank(
        event.rankId,
      );
      print('*-'*100);
      print('userRanking->$userRanking');
      print('usersRankings->$usersRankings');
      print('usersRankingByRank->$usersRankingByRank');
      print('usersRankingsByRank->$usersRankingsByRank');
      print('*-'*100);
    });
  }
}
