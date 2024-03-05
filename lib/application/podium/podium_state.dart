part of 'podium_bloc.dart';

@freezed
class PodiumState with _$PodiumState {
  const factory PodiumState({
    required bool isLoading,
    required List<UserRank> leagueRanking,
    required int userLeagueRanking,
    required int userGlobalRanking,
    required AudioPlayer winSound,
    required AudioPlayer loseSound,
  }) = _PodiumState;

  factory PodiumState.initial() => PodiumState(
        isLoading: true,
        userLeagueRanking: 0,
        userGlobalRanking: 0,
        leagueRanking: [],
        loseSound: AudioPlayer(),
        winSound: AudioPlayer(),
      );
}
