import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../entities/referral_program.dart';

part 'profile_response.freezed.dart';

part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required List<ReferralProgram> referrals,
  }) = _ProfileResponse;

  const ProfileResponse._();

  factory ProfileResponse.fromJson(Json json) =>
      _$ProfileResponseFromJson(json);
}
