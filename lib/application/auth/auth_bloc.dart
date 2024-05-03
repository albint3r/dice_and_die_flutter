import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../domain/auth/app_user.dart';
import '../../domain/auth/errors/auth_error.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/schemas/auth_response.dart';
import '../../injectables.dart';
import '../../presentation/core/router/app_router.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(IAuthFacade facade) : super(AuthState.initial()) {
    on<_ValidateInitialSessionToken>((event, emit) async {
      // Initialize the Share Preference to obtain the Session Token
      await facade.pref.init();
      final sessionToken = await facade.pref.getSessionToken();
      // If Session token get User data from the server
      if (sessionToken.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
        return;
      }
      try {
        final response = await facade.loginFromSessionToken(
          sessionToken,
        );
        emit(
          state.copyWith(
            sessionToken: response.sessionToken,
            appUser: response.appUser,
            error: null,
          ),
        );
        // Wait 1 second to avoid overlap the login screen with the
        // Waiting room screen.
        // Update the Session token every time the user open the app.
        await facade.saveSessionTokenInPref(
          state.sessionToken,
        );
        // Navigate to the Lobby After the user logging
        if (state.sessionToken.isNotEmpty) {
          final router = getIt<AppRouter>();
          router.replaceAll([
            const LobbyRoute(),
          ]);
          await Future.delayed(const Duration(seconds: 1));
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        // If the LoginFrom Session Token Fail
        // it means the token session expired or is invalid.
        // So I need to remove the current session Token
        await _logOut(emit, facade);
      }
    });
    on<_SigInWithEmailAndPassword>((event, emit) async {
      try {
        final form = event.loginRawValues;
        final email = form['email'];
        final password = form['password'];
        final name = form['name'];
        final referralCode = form['referral code'] ?? '';
        if (email is String &&
            password is String &&
            name is String &&
            referralCode is String) {
          final response = await facade.signIn(
            email,
            name,
            password,
            referralCode,
          );
          await _signInOrLogin(
            response,
            emit,
            facade,
          );
        }
        // Navigate to the Lobby After the user logging
        if (state.sessionToken.isNotEmpty) {
          final router = getIt<AppRouter>();
          router.replaceAll([
            const LobbyRoute(),
          ]);
          await Future.delayed(const Duration(seconds: 1));
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        _notifyError(
          emit,
          'Invalid password or account',
          AuthErrorType.signUp,
        );
      }
    });
    on<_LogInWithEmailAndPassword>((event, emit) async {
      try {
        final form = event.loginRawValues;
        final email = form['email'];
        final password = form['password'];
        if (email is String && password is String) {
          final response = await facade.logIn(email, password);
          await _signInOrLogin(
            response,
            emit,
            facade,
          );
        }
        // Navigate to the Lobby After the user logging
        if (state.sessionToken.isNotEmpty) {
          final router = getIt<AppRouter>();
          router.replaceAll([
            const LobbyRoute(),
          ]);
          await Future.delayed(const Duration(seconds: 1));
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        _notifyError(
          emit,
          'Invalid password or account',
          AuthErrorType.logIn,
        );
      }
    });
    on<_LogOut>((event, emit) async {
      await _logOut(emit, facade);
    });
    on<_NotifyUserUpdatesAfterGameEnds>((event, emit) async {
      emit(
        state.copyWith(
          appUser: event.appUser,
        ),
      );
    });
    on<_UpdateUserName>((event, emit) async {
      emit(
        state.copyWith(
          appUser: state.appUser?.copyWith(
            name: event.newUserName,
          ),
        ),
      );
    });
    on<_SigInWithGoogle>((event, emit) async {
      try {
        final authCredentials = await facade.signInWithGoogle();
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );
        final response = await facade.logInWithGoogle(authCredentials);

        await _signInOrLogin(
          response,
          emit,
          facade,
        );
        if (state.sessionToken.isNotEmpty) {
          final router = getIt<AppRouter>();
          router.replaceAll([
            const LobbyRoute(),
          ]);
          await Future.delayed(const Duration(seconds: 1));
          emit(
            state.copyWith(
              isLoading: false,
            ),
          );
        }
      } catch (e) {
        l.d('[_SigInWithGoogle]: User canceled the google login pop up');
      }
    });
  }

  /// Emit the error for every listener trigger their event if apply the condition
  ///
  /// The condition are defined by the error type, if the error type match
  /// it would trigger the bloc listener. Generally related with login, signing.
  void _notifyError(
    Emitter<AuthState> emit,
    String errorMsg,
    AuthErrorType type,
  ) {
    emit(
      state.copyWith(
        isLoading: false,
        error: AuthError(
          errorMsg: errorMsg,
          type: type,
        ),
      ),
    );
    emit(
      state.copyWith(
        error: null,
      ),
    );
  }

  Future<void> _logOut(Emitter<AuthState> emit, IAuthFacade facade) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    await facade.logOut();
    emit(
      state.copyWith(
        appUser: null,
        sessionToken: '',
        isLoading: false,
        error: null,
      ),
    );
    final router = getIt<AppRouter>();
    router.replaceAll([
      const LoginRoute(),
    ]);
  }

  Future<void> _signInOrLogin(
    AuthResponse response,
    Emitter<AuthState> emit,
    IAuthFacade facade,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    // Validate the Form have email and password information.
    emit(
      state.copyWith(
        sessionToken: response.sessionToken,
        appUser: response.appUser,
        error: null,
      ),
    );
    await facade.saveSessionTokenInPref(
      state.sessionToken,
    );
  }
}
