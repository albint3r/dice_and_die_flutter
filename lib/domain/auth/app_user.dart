import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';
import 'bank_account.dart';
import 'user_level.dart';

part 'app_user.freezed.dart';

part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(name: 'creation_date') required DateTime creationDate,
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'is_verify') required bool isVerify,
    @JsonKey(name: 'user_level') required UserLevel userLevel,
    @JsonKey(name: 'bank_account') required BankAccount bankAccount,
  }) = _AppUser;

  const AppUser._();

  factory AppUser.fromJson(Json json) => _$AppUserFromJson(json);

}
