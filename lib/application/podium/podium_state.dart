part of 'podium_bloc.dart';

@freezed
class PodiumState with _$PodiumState {
  const factory PodiumState({
    required bool isLoading,
    required int userGlobalRanking,
    required int userRankRanking,
  }) = _PodiumState;

  factory PodiumState.initial() => const PodiumState(
        isLoading: false,
        userGlobalRanking: 0,
        userRankRanking: 0,
      );
}
