part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    required isLoading,
    FormGroup? formGroup,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        isLoading: true,
      );
}
