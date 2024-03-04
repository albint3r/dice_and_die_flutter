
import '../../ranking/entities/user_rank.dart';

abstract interface class IPodiumFacade {
  Future<UserRank> getUserGlobalRanking();

}
