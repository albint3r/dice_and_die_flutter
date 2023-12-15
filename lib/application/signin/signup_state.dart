part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    required bool isLoading,
    FormGroup? formGroup,
    AuthError? error,
  }) = _SignupState;

  factory SignupState.initial() => SignupState(
        isLoading: true,
      );
}
