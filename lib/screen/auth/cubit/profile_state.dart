part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;
  ProfileSuccess(this.user);
}

class ProfileFailed extends ProfileState {
  final String errors;

  ProfileFailed(this.errors);
}
