import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musa/features/profile/data/models/profile_model.dart';
import 'package:musa/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  ProfileRepo profileRepo;
  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final uid = profileRepo.getCurrentUid();
      if (uid != null) {
        final profile = await profileRepo.getProfile(uid: uid);
        emit(ProfileLoaded(profileModel: profile!));
      } else {
        emit(ProfileError(errMessage: 'User Not Found,Please Login First'));
      }
    } on Exception catch (e) {
      emit(ProfileError(errMessage: e.toString()));
    }
  }

  Future<void> createProfile(ProfileModel profile) async {
    emit(ProfileLoading());
    final uid = profileRepo.getCurrentUid();
    if (uid != null) {
      await profileRepo.createProfile(uid, profile);
      final newProfile = await profileRepo.getProfile(uid: uid);
      emit(ProfileLoaded(profileModel: newProfile!));
    } else {
      emit(ProfileError(errMessage: 'User Not Found,Please Login First'));
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    emit(ProfileLoading());
    final uid = profileRepo.getCurrentUid();
    if (uid != null) {
      await profileRepo.updateProfile(uid, profile);
      final updatedProfile = await profileRepo.getProfile(uid:uid);
      emit(ProfileLoaded(profileModel: updatedProfile!));
    }else{
      emit(ProfileError(errMessage: 'User Not Found,Please Login First'));
    }
  }

  String? getName() {
    return profileRepo.getName();
  }
}
