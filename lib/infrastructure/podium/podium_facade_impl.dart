import 'package:injectable/injectable.dart';
import '../../domain/podium/use_cases/i_podium_facade.dart';
import '../../domain/ranking/entities/user_rank.dart';
import '../../domain/ranking/i_ranking_data_source.dart';

@Injectable(as: IPodiumFacade)
class PodiumFacadeImpl implements IPodiumFacade {
  PodiumFacadeImpl(this._dataSource);

  // This DataSource contains the EndPoint to obtain the User Rank.
  final IRankingDataSource _dataSource;

  @override
  Future<UserRank> getUserGlobalRanking() => _dataSource.getUserGlobalRanking();

  @override
  Future<UsersRanks> getLeagueRanking(int rankId) =>
      _dataSource.getLeagueRanking(
        rankId,
      );

  @override
  Future<UserRank> getUserLeagueRanking(int rankId) =>
      _dataSource.getUserLeagueRanking(
        rankId,
      );
}
