abstract interface class IPodiumFacade {
  Future<void> getUsersRanking();

  Future<void> getUserRanking();

  Future<void> getUsersRankingByRank();

  Future<void> getUserRankingByRank();
}
