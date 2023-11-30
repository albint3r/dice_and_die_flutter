import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  factory Board({
    required List<int> col1,
    required List<int> col2,
    required List<int> col3,
    required ColumnScore score1,
    required ColumnScore score2,
    required ColumnScore score3,
    @JsonKey(name: 'total_score')required int totalScore,
  }) = _Board;

  const Board._();

  factory Board.fromJson(Json json) => _$BoardFromJson(json);
}

@freezed
class ColumnScore with _$ColumnScore {
  factory ColumnScore({
    required int val,
  }) = _ColumnScore;

  const ColumnScore._();

  factory ColumnScore.fromJson(Json json) => _$ColumnScoreFromJson(json);
}
