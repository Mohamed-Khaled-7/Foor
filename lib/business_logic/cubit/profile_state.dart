part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  ProfileLoaded({required this.profileModel});
}
class ProfileLoggedOut extends ProfileState {}