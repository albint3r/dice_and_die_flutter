import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';

part 'b_column.freezed.dart';

part 'b_column.g.dart';

@freezed
class BColumn with _$BColumn {
  const factory BColumn({
    required List<int> values,
    required int score,
    @Default(3) int maxLength,
  }) = _BColumn;

  const BColumn._();

  factory BColumn.fromJson(Json json) => _$BColumnFromJson(json);
}
