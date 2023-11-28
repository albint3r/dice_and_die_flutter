import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';
import 'board.dart';

part 'die.freezed.dart';

part 'die.g.dart';

@freezed
class Die with _$Die {
  const factory Die({
    int? number,
  }) = _Die;

  const Die._();

  factory Die.fromJson(Json json) => _$DieFromJson(json);
}
