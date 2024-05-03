import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';

part 'referral_program.freezed.dart';

part 'referral_program.g.dart';

@freezed
class ReferralProgram with _$ReferralProgram {
  const factory ReferralProgram({
    @JsonKey(name: 'creation_date') required DateTime creationDate,
    @JsonKey(name: 'referral_code') required String referralCode,
    @JsonKey(name: 'promoter_user_id') required String promoterUserId,
    @JsonKey(name: 'referred_user_id') required String referredUserId,
    @JsonKey(name: 'total_deposits') required int totalDeposits,
    @JsonKey(name: 'total_rewards') required double totalRewards,
    required bool active,
  }) = _ReferralProgram;

  const ReferralProgram._();

  factory ReferralProgram.fromJson(Json json) =>
      _$ReferralProgramFromJson(json);
}
