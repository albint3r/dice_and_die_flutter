import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../app_user.dart';

part 'auth_response.freezed.dart';

part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'user') required AppUser appUser,
    @JsonKey(name: 'session_token')required String sessionToken,
    @JsonKey(name: 'status_code')required int statusCode,
  }) = _AuthResponse;

  const AuthResponse._();

  factory AuthResponse.fromJson(Json json) => _$AuthResponseFromJson(json);
}
