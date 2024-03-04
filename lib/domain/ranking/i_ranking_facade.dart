import '../podium/entities/user_rank.dart';

abstract interface class IRankingFacade {
  Future<UsersRanks> getGlobalRanking();

  Future<UsersRanks> getLeagueRanking(int rankId);

  Future<UserRank> getUserGlobalRanking();

  Future<UserRank> getUserLeagueRanking(int rankId);
}
