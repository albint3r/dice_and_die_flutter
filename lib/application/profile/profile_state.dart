part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    required bool isLoading,
    required bool isEditing,
    required String newUserName,
    required List<ReferralProgram> referrals,
    FormGroup? formGroup,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        isLoading: true,
        isEditing: false,
        newUserName: '',
        referrals: [],
      );
}
