import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../entities/game.dart';

part 'response.freezed.dart';

part 'response.g.dart';

@freezed
class ResponseGame with _$ResponseGame {
  const factory ResponseGame({
    required Game game,
    required Json extras,
    required String message,
  }) = _ResponseGame;

  const ResponseGame._();

  factory ResponseGame.fromJson(Json json) => _$ResponseGameFromJson(json);
}
