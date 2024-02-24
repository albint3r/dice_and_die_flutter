import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import 'b_column.dart';

part 'board.freezed.dart';

part 'board.g.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required Map<int, BColumn> columns,
    required int score,
  }) = _Board;

  const Board._();

  factory Board.fromJson(Json json) => _$BoardFromJson(json);
}
