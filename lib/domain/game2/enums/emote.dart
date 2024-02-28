import 'package:freezed_annotation/freezed_annotation.dart';

enum Emote {
  hello,
  help,
  @JsonValue('invalid_input_event')
  invalidInputEvent,
  jajaja,
  nice,
  sorry,
  thinking,
}
