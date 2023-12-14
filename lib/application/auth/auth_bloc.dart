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
    on<_Started>((event, emit) async {
      final sessionToken = event.sessionToken;
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
        await facade.saveSessionTokenInPref(
          state.sessionToken,
        );

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
