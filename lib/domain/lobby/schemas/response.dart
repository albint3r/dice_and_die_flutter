import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../entities/lobby.dart';

part 'response.freezed.dart';

part 'response.g.dart';

@freezed
class ResponseLobby with _$ResponseLobby {
  const factory ResponseLobby({
    @JsonKey(name: 'active_games') required Lobby lobby,
    @JsonKey(name: 'total_players') required int totalPlayers,
  }) = _ReponseLobby;

  const ResponseLobby._();

  factory ResponseLobby.fromJson(Json json) => _$ResponseLobbyFromJson(json);
}
