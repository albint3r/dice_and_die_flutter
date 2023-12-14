import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/auth/errors/auth_error.dart';
import '../../domain/login/i_login_form_facade.dart';

part 'login_form_event.dart';

part 'login_form_state.dart';

part 'login_form_bloc.freezed.dart';

@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc(ILoginFormFacade facade) : super(LoginFormState.initial()) {
    on<_Started>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          formGroup: facade.fromGroup,
          error: null,
        ),
      );
    });
    on<_SetError>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          error: event.error,
        ),
      );
    });
  }
}
