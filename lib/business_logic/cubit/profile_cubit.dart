import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/data/repository/proifle_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.Repo}) : super(ProfileInitial());
  final ProfileRepository Repo;

  Future<void> getProfile() async {
    //بنعرض الداتا الاول من اللوكال وبعد كدا نحدثها من الريموت
    ProfileModel? LocalProfile = Repo.getProfileLocal();
    if (LocalProfile != null) {
      emit(ProfileLoaded(profileModel: LocalProfile));
    } else {
      emit(ProfileLoading());
    }
    try {
      var uid = Repo.getCurrentUid();
      var remoteProfile = await Repo.fetchProfileFromServer(uid);
      if (remoteProfile != null) {
        Repo.saveProfileLocal(remoteProfile);
        emit(ProfileLoaded(profileModel: remoteProfile));
      }
    } on Exception catch (e) {
      if (LocalProfile == null) {
        emit(ProfileError(errMessage: 'Failed to fetch profile: $e'));
      }
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    try {
      emit(ProfileLoading());
      var uid = Repo.getCurrentUid();
      await Repo.UpdateProfile(uid, profile); //من السيرفر
      Repo.saveProfileLocal(profile); //in local
      emit(ProfileLoaded(profileModel: profile));
    } catch (e) {
      emit(ProfileError(errMessage: 'error $e'));
    }
  }

  getName() {
    return Repo.getName();
  }

 
  void resetProfile() {
    emit(ProfileInitial());
  }
}
