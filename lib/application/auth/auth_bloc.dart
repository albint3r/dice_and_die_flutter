import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/app_user.dart';
import '../../domain/auth/errors/auth_error.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/schemas/auth_response.dart';

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
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: AuthError(
              errorMsg: 'Account Already Exist',
              type: AuthErrorType.signUp,
            ),
          ),
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
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: AuthError(
              errorMsg: 'User Or Password Incorrect',
              type: AuthErrorType.logIn,
            ),
          ),
        );
      }
    });
    on<_LogOut>((event, emit) async {
      await _logOut(emit, facade);
    });
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
    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }
}
