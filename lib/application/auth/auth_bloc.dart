import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
        await Future.delayed(const Duration(seconds: 1));
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
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
        if (email is String && password is String) {
          await _signInOrLogin(
            email,
            password,
            emit,
            facade,
            facade.signIn,
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
          await _signInOrLogin(
            email,
            password,
            emit,
            facade,
            facade.logIn,
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
          isAfterGame: true,
          appUser: event.appUser,
        ),
      );
      emit(
        state.copyWith(
          isAfterGame: false,
        ),
      );
    });
    on<_UpdateUserName>((event, emit) async {
      emit(
        state.copyWith(
          isAfterGame: true,
          appUser: state.appUser?.copyWith(
            name: event.newUserName,
          ),
        ),
      );
      emit(
        state.copyWith(
          isAfterGame: false,
        ),
      );
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
  }

  Future<void> _signInOrLogin(
    String email,
    String password,
    Emitter<AuthState> emit,
    IAuthFacade facade,
    Future<AuthResponse> Function(String, String) callBack,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    // Validate the Form have email and password information.
    final response = await callBack(
      email,
      password,
    );
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
