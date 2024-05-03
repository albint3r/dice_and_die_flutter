part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;

  const factory ProfileEvent.isEditing() = _IsEditing;

  const factory ProfileEvent.sendChange() = _SendChange;

  const factory ProfileEvent.copyPromoteCode() = _SendChange;
}
