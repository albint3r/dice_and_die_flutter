import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/podium/i_podium_data_source.dart';
import '../../domain/podium/user_rank.dart';

@Injectable(as: IPodiumDataSource)
class PodiumDataSourceImpl implements IPodiumDataSource {
  PodiumDataSourceImpl(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<void> getUserRanking() async {
    const path = "/v2/auth/ranks";
    final response = await _dio.get(path);
    final usersRanks = UsersRanks.fromJson(response.data as Json);
    print('*-' * 100);
    print('UsersRanks -> $usersRanks');
    print('*-' * 100);
  }

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
