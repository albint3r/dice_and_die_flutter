import 'package:injectable/injectable.dart';

import '../../domain/podium/i_podium_data_source.dart';
import '../../domain/podium/i_podium_facade.dart';

@Injectable(as: IPodiumFacade)
class PodiumFacadeImpl implements IPodiumFacade {
  PodiumFacadeImpl(this._dataSource);

  final IPodiumDataSource _dataSource;

  @override
  Future<void> getUserRanking() => _dataSource.getUserRanking();

  @override
  Future<void> getUserRankingByRank() {
    // TODO: implement getUserRankingByRank
    throw UnimplementedError();
  }

  @override
  Future<void> getUsersRanking() {
    // TODO: implement getUsersRanking
    throw UnimplementedError();
  }

  @override
  Future<void> getUsersRankingByRank() {
    // TODO: implement getUsersRankingByRank
    throw UnimplementedError();
  }
}
