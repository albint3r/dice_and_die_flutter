part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool isLoading,
    AppUser? appUser,
    required String sessionToken,
    AuthError? error,
    required bool isAfterGame,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        isLoading: true,
        isAfterGame: false,
        sessionToken: '',
      );
}
