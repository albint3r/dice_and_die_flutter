part of 'login_form_bloc.dart';

@freezed
class LoginFormState with _$LoginFormState {
  factory LoginFormState({
    required bool isLoading,
    FormGroup? formGroup,
    AuthError? error,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        isLoading: true,
      );
}
