import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/podium/entities/user_rank.dart';
import '../../domain/podium/errors/errors.dart';
import '../../domain/podium/use_cases/i_podium_data_source.dart';

@Injectable(as: IPodiumDataSource)
class PodiumDataSourceImpl implements IPodiumDataSource {
  PodiumDataSourceImpl(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<UserRank> getUserRanking() async {
    try {
      const path = "/v2/auth/ranks/user";
      final response = await _dio.get(path);
      return UserRank.fromJson(response.data['user_rank'] as Json);
    } catch (e) {
      throw ErrorFetchingUserRank(
        'You have an error fetching the Users Ranking. This is your error: $e',
      );
    }
  }

  @override
  Future<UserRank> getUserRankingByRank(
    int rankId,
  ) async {
    try {
      final path = "/v2/auth/ranks/category/$rankId/user";
      final response = await _dio.get(path);
      return UserRank.fromJson(response.data['user_rank'] as Json);
    } catch (e) {
      throw ErrorFetchingUserRank(
        'You have an error fetching the Users Ranking. This is your error: $e',
      );
    }
  }

  @override
  Future<UsersRanks> getUsersRanking() async {
    try {
      const path = "/v2/auth/ranks";
      final response = await _dio.get(path);
      return UsersRanks.fromJson(response.data as Json);
    } catch (e) {
      throw ErrorFetchingUsersRank(
        'You have an error fetching the Users Ranking. This is your error: $e',
      );
    }
  }

  @override
  Future<UsersRanks> getUsersRankingByRank(
    int rankId,
  ) async {
    try {
      final path = "/v2/auth/ranks/category/$rankId";
      final response = await _dio.get(path);
      return UsersRanks.fromJson(response.data as Json);
    } catch (e) {
      throw ErrorFetchingUsersRank(
        'You have an error fetching the Users Ranking. This is your error: $e',
      );
    }
  }
}
