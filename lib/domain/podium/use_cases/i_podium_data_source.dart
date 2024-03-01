import '../entities/user_rank.dart';

abstract interface class IPodiumDataSource {
  Future<UsersRanks> getUsersRanking();

  Future<UserRank> getUserRanking();

  Future<UsersRanks> getUsersRankingByRank(
    int rankId,
  );

  Future<UserRank> getUserRankingByRank(
    int rankId,
  );
}
