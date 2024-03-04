import 'package:injectable/injectable.dart';

import '../../domain/podium/entities/user_rank.dart';
import '../../domain/ranking/i_ranking_data_source.dart';
import '../../domain/ranking/i_ranking_facade.dart';

@Injectable(as: IRankingFacade)
class RankingFacadeImpl implements IRankingFacade {
  RankingFacadeImpl(this._dataSource);

  final IRankingDataSource _dataSource;

  @override
  Future<UsersRanks> getGlobalRanking() => _dataSource.getGlobalRanking();

  @override
  Future<UsersRanks> getLeagueRanking(int rankId) =>
      _dataSource.getLeagueRanking(
        rankId,
      );

  @override
  Future<UserRank> getUserGlobalRanking() => _dataSource.getUserGlobalRanking();

  @override
  Future<UserRank> getUserLeagueRanking(int rankId) =>
      _dataSource.getUserLeagueRanking(
        rankId,
      );
}
