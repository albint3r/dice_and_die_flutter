import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/auth/errors/auth_error.dart';
import '../../domain/signup/i_signup_facade.dart';

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(ISignUpFacade facade) : super(SignupState.initial()) {
    on<_Started>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          formGroup: facade.formGroup,
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
