part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateUserLoaded extends UpdateProfileState {}

final class UpdateUserSuccess extends UpdateProfileState {}

final class UpdateUserFailure extends UpdateProfileState {
  final String errMessage;

  UpdateUserFailure(this.errMessage);
}
