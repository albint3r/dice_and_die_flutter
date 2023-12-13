import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';

part 'bank_account.freezed.dart';

part 'bank_account.g.dart';

@freezed
class BankAccount with _$BankAccount {
  const factory BankAccount({
    required double amount,
  }) = _BankAccount;

  const BankAccount._();

  factory BankAccount.fromJson(Json json) => _$BankAccountFromJson(json);
}
