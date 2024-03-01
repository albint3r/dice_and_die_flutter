import 'package:freezed_annotation/freezed_annotation.dart';

enum Emote {
  haha,
  hello,
  nice,
  omg,
  @JsonValue('invalid_input_event')
  invalidInputEvent,
  sorry,
  wow,
  wtf,
  yes,
}
