import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';
import 'rank.dart';

part 'user_level.freezed.dart';

part 'user_level.g.dart';

@freezed
class UserLevel with _$UserLevel {
  const factory UserLevel({
    @JsonKey(name: 'rank_id') required int rankId,
    required int level,
    @JsonKey(name: 'exp_points') required int expPoints,
    @JsonKey(name: 'next_level_points') required int nextLevelPoints,
  }) = _UserLevel;

  const UserLevel._();

  factory UserLevel.fromJson(Json json) => _$UserLevelFromJson(json);

  Rank get rank => Rank.values[rankId - 1];
}
