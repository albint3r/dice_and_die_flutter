import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../../game_play/entities/game.dart';

part 'lobby.freezed.dart';

part 'lobby.g.dart';

@freezed
class Lobby with _$Lobby {
  const factory Lobby({
    @JsonKey(name: 'active_games')required Map<String, Game>? activeGames,
  }) = _Lobby;

  const Lobby._();

  factory Lobby.fromJson(Json json) => _$LobbyFromJson(json);
}
