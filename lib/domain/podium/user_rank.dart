import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';

part 'user_rank.freezed.dart';

part 'user_rank.g.dart';

@freezed
class UserRank with _$UserRank {
  const factory UserRank({
    required int ranking,
    required String name,
    @JsonKey(name: "last_name") required String lastName,
    required int level,
    @JsonKey(name: "exp_points") required int expPoints,
    @JsonKey(name: "rank_id") required int rankId,
  }) = _UserRank;

  const UserRank._();

  factory UserRank.fromJson(Json json) => _$UserRankFromJson(json);
}

@freezed
class UsersRanks with _$UsersRanks {
  const factory UsersRanks({
    @JsonKey(name: 'users_ranks') required List<UserRank> usersRanks,
  }) = _UsersRanks;

  const UsersRanks._();

  factory UsersRanks.fromJson(Json json) => _$UsersRanksFromJson(json);
}
