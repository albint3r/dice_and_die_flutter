import 'package:injectable/injectable.dart';

import '../../domain/podium/entities/user_rank.dart';
import '../../domain/podium/use_cases/i_podium_data_source.dart';
import '../../domain/podium/use_cases/i_podium_facade.dart';

@Injectable(as: IPodiumFacade)
class PodiumFacadeImpl implements IPodiumFacade {
  PodiumFacadeImpl(this._dataSource);

  final IPodiumDataSource _dataSource;

  @override
  Future<UserRank> getUserRanking() => _dataSource.getUserRanking();

  @override
  Future<UserRank> getUserRankingByRank(int rankId) =>
      _dataSource.getUserRankingByRank(
        rankId,
      );

  @override
  Future<UsersRanks> getUsersRanking() => _dataSource.getUsersRanking();

  @override
  Future<UsersRanks> getUsersRankingByRank(int rankId) =>
      _dataSource.getUsersRankingByRank(
        rankId,
      );
}
