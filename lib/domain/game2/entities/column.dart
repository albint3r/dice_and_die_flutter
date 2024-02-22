import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';

part 'column.freezed.dart';

part 'column.g.dart';

@freezed
class Column with _$Column {
  const factory Column({
    required List<int> values,
    required int score,
    @Default(3) int maxLength,
  }) = _Column;

  const Column._();

  factory Column.fromJson(Json json) => _$ColumnFromJson(json);
}
