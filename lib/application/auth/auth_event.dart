part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started({
    required String? sessionToken,
  }) = _Started;
}
