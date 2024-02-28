import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../entities/game.dart';
import '../enums/emote.dart';

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

@freezed
class ResponseEmoteExtras with _$ResponseEmoteExtras {
  const factory ResponseEmoteExtras({
    @JsonKey(name: 'player_id') required String playerId,
    required Emote emote,
    required DateTime time,
  }) = _ResponseEmoteExtras;

  const ResponseEmoteExtras._();

  factory ResponseEmoteExtras.fromJson(Json json) =>
      _$ResponseEmoteExtrasFromJson(json);
}
