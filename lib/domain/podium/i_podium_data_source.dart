abstract interface class IPodiumDataSource {
  Future<void> getUsersRanking();

  Future<void> getUserRanking();

  Future<void> getUsersRankingByRank();

  Future<void> getUserRankingByRank();
}
