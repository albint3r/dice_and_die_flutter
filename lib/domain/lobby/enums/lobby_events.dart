import 'package:freezed_annotation/freezed_annotation.dart';

enum LobbyEvents {
  @JsonKey(name: 'invalid_input_event')
  invalidInputEvent,
  @JsonKey(name: 'update_games')
  updateGames
}
