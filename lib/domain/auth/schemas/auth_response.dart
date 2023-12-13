import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';
import '../app_user.dart';

part 'auth_response.freezed.dart';

part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required AppUser appUser,
    required String sessionToken,
    required int statusCode,
  }) = _AuthResponse;

  AuthResponse._();

  factory AuthResponse.fromJson(Json json) => _$AuthResponseFromJson(json);
}
