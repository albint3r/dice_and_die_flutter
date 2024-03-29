import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/ranking/entities/user_rank.dart';
import '../../domain/ranking/i_ranking_facade.dart';

part 'ranking_event.dart';

part 'ranking_state.dart';

part 'ranking_bloc.freezed.dart';

@injectable
class RankingBloc extends Bloc<RankingEvent, RankingState> {
  RankingBloc(IRankingFacade facade) : super(RankingState.initial()) {
    on<_Started>((event, emit) async {
      final globalRanking = await facade.getGlobalRanking();
      final userRank = await facade.getUserGlobalRanking();
      final globalFirstPlaceUser = globalRanking.usersRanks.first;
      emit(
        state.copyWith(
          isLoading: false,
          globalUsersRanks: globalRanking.usersRanks.skip(1).toList(),
          userRank: userRank,
          globalFirstPlaceUser: globalFirstPlaceUser,
        ),
      );
    });
  }
}
