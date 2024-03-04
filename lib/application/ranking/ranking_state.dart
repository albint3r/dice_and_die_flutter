part of 'ranking_bloc.dart';

@freezed
class RankingState with _$RankingState {
  factory RankingState({
    required bool isLoading,
    required List<UserRank> globalUsersRanks,
    required List<UserRank> leagueUsersRanks,
    UserRank? userRank,
    UserRank? leagueUserRank,
  }) = _RankingState;

  factory RankingState.initial() => RankingState(
        isLoading: true,
        globalUsersRanks: [],
        leagueUsersRanks: [],
      );
}
