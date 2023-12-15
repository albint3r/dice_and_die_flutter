part of 'login_form_bloc.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.started() = _Started;
  const factory LoginFormEvent.setError(AuthError error) = _SetError;
}
