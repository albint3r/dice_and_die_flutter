import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/app_user.dart';
import '../core/types.dart';

part 'response_update_user_name.freezed.dart';

part 'response_update_user_name.g.dart';

@freezed
class ResponseUpdateUserName with _$ResponseUpdateUserName {
  const factory ResponseUpdateUserName({
    @JsonKey(name: 'user') required AppUser appUser,
    @JsonKey(name: 'status_code') required int statusCode,
  }) = _ResponseUpdateUserNamel;

  const ResponseUpdateUserName._();

  factory ResponseUpdateUserName.fromJson(Json json) =>
      _$ResponseUpdateUserNameFromJson(json);
}
