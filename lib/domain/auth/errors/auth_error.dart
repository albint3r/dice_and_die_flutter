import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/types.dart';

part 'auth_error.freezed.dart';

part 'auth_error.g.dart';

@freezed
class AuthError with _$AuthError {
  factory AuthError({
    required String errorMsg,
    required AuthErrorType type,
  }) = _AuthError;

  const AuthError._();

  factory AuthError.fromJson(Json json) => _$AuthErrorFromJson(
        json,
      );
}

enum AuthErrorType {
  signUp,
  logIn,
  other,
}
