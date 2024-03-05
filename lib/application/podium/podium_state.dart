part of 'podium_bloc.dart';

@freezed
class PodiumState with _$PodiumState {
  const factory PodiumState({
    required bool isLoading,
    required List<UserRank> leagueRanking,
    required int userLeagueRanking,
    required int userGlobalRanking,
  }) = _PodiumState;

  factory PodiumState.initial() => const PodiumState(
        isLoading: true,
        userLeagueRanking: 0,
        userGlobalRanking: 0,
        leagueRanking: [],
      );
}
