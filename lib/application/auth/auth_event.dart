part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.validateInitialSessionToken() =
      _ValidateInitialSessionToken;

  const factory AuthEvent.sigInWithEmailAndPassword(
    Map<String, Object?> loginRawValues,
  ) = _SigInWithEmailAndPassword;

  const factory AuthEvent.logInWithEmailAndPassword(
    Map<String, Object?> loginRawValues,
  ) = _LogInWithEmailAndPassword;

  const factory AuthEvent.logOut() = _LogOut;
}
