import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/types.dart';
import '../../domain/podium/entities/user_rank.dart';
import '../../domain/podium/errors/errors.dart';
import '../../domain/ranking/i_ranking_data_source.dart';

@Injectable(as: IRankingDataSource)
class RankingDataSourceImpl implements IRankingDataSource {
  RankingDataSourceImpl(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<UserRank> getUserGlobalRanking() async {
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
  Future<UserRank> getUserLeagueRanking(
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
  Future<UsersRanks> getGlobalRanking() async {
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
  Future<UsersRanks> getLeagueRanking(
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
