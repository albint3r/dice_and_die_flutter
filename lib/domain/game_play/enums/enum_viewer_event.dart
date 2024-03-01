import 'package:freezed_annotation/freezed_annotation.dart';

enum EnumViewerEvent {
  @JsonKey(name: 'invalid_input_event')
  invalidInputEvent,
  boring,
  p1,
  p2,
}
