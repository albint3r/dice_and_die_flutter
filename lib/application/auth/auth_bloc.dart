import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/app_user.dart';
import '../../domain/auth/i_auth_facade.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

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
        await facade.deleteSessionTokenInPref();
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      }
    });
  }
}
