import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/profile/i_profile_facade.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(IProfileFacade facade) : super(ProfileState.initial()) {
    on<_Started>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          formGroup: facade.formGroup,
        ),
      );
    });
    on<_IsEditing>((event, emit) {
      emit(
        state.copyWith(
          isEditing: true,
        ),
      );
    });
    on<_SendChange>((event, emit) {
      emit(
        state.copyWith(
          isEditing: false,
        ),
      );
    });
  }
}
