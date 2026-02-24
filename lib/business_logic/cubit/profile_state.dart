part of 'profile_cubit.dart';

 sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  ProfileLoaded({required this.profileModel});
}
class ProfileLoggedOut extends ProfileState {}
class ProfileError extends ProfileState {
  final String errMessage;
  ProfileError({required this.errMessage});
}
class ProfileLoading extends ProfileState {}
