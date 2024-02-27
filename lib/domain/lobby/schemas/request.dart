import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../enums/lobby_events.dart';

part 'request.freezed.dart';

part 'request.g.dart';

@freezed
class RequestLobbyEvent with _$RequestLobbyEvent {
  factory RequestLobbyEvent({
    required LobbyEvents events,
  }) = _RequestLobbyEvent;

  const RequestLobbyEvent._();

  factory RequestLobbyEvent.fromJson(Json json) =>
      _$RequestLobbyEventFromJson(json);
}
