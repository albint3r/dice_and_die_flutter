import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/types.dart';

part 'responses.freezed.dart';

part 'responses.g.dart';

@freezed
class ActiveGamesResponses with _$ActiveGamesResponses {
  const factory ActiveGamesResponses({
    @JsonKey(name: 'status_code') int? statusCode,
    required Map<String, dynamic> response,
  }) = _ActiveGamesResponses;

  const ActiveGamesResponses._();

  

  factory ActiveGamesResponses.fromJson(Json json) =>
      _$ActiveGamesResponsesFromJson(json);
}
