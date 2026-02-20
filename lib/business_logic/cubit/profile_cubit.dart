import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/data/repository/proifle_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.Repo}) : super(ProfileInitial());
  final ProfileRepository Repo;
  profileData() {
    final profileData = Repo.getProfile();
    if (profileData != null) {
      emit(ProfileLoaded(profileModel: profileData));
    }else{
       emit(ProfileLoaded(
      profileModel: ProfileModel(
        firstName: '',
        lastName: '',
        email: '',
        user: '',
        image: '',
      ),
    ));
    }
  }

  updateProfile(ProfileModel profile) {
    Repo.saveProfile(profile);
    emit(ProfileLoaded(profileModel: profile));
  }
  getName()
  {
    return Repo.getName();
  }
}
