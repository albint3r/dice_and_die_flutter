import '../../ranking/entities/user_rank.dart';

abstract interface class IPodiumFacade {
  Future<UserRank> getUserGlobalRanking();

  Future<UserRank> getUserLeagueRanking(int rankId);

  Future<UsersRanks> getLeagueRanking(int rankId);
}
