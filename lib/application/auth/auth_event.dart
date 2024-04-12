part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.validateInitialSessionToken() =
      _ValidateInitialSessionToken;

  const factory AuthEvent.sigInWithGoogle() =
  _SigInWithGoogle;

  const factory AuthEvent.sigInWithEmailAndPassword(
    Map<String, Object?> loginRawValues,
  ) = _SigInWithEmailAndPassword;

  const factory AuthEvent.logInWithEmailAndPassword(
    Map<String, Object?> loginRawValues,
  ) = _LogInWithEmailAndPassword;

  const factory AuthEvent.notifyUserUpdatesAfterGameEnds(
    AppUser appUser,
  ) = _NotifyUserUpdatesAfterGameEnds;

  const factory AuthEvent.logOut() = _LogOut;

  const factory AuthEvent.updateUserName(
    String newUserName,
  ) = _UpdateUserName;
}
