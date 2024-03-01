import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';

part 'die.freezed.dart';

part 'die.g.dart';

@freezed
class Die with _$Die {
  const factory Die({
    @JsonKey(name: 'current_number') int? currentNumber,
    @Default(1) int minHead,
    @Default(6) int maxHead,
  }) = _Die;

  const Die._();

  factory Die.fromJson(Json json) => _$DieFromJson(json);
}
