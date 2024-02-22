import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import 'column.dart';

part 'board.freezed.dart';

part 'board.g.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required Map<int, Column> columns,
    required int score,
  }) = _Board;

  const Board._();

  factory Board.fromJson(Json json) => _$BoardFromJson(json);
}
