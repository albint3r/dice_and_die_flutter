import 'package:freezed_annotation/freezed_annotation.dart';

enum Emote {
  @JsonValue('invalid_input_event')
  invalidInputEvent,
  @JsonValue('sorry')
  sorry,
  @JsonValue('help')
  help,
  @JsonValue('jajaja')
  jajaja,
}
