part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {
  const factory SignupEvent.started() = _Started;
  const factory SignupEvent.setError(AuthError error) = _SetError;
}
