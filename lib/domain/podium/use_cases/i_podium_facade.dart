import '../entities/user_rank.dart';

abstract interface class IPodiumFacade {
  Future<UsersRanks> getUsersRanking();

  Future<UserRank> getUserRanking();

  Future<UsersRanks> getUsersRankingByRank(int rankId);

  Future<UserRank> getUserRankingByRank(int rankId);
}
