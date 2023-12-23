part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    required bool isLoading,
    required bool isEditing,
    FormGroup? formGroup,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        isLoading: true,
        isEditing: false,
      );
}
