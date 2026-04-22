import 'package:musa/features/profile/data/models/profile_model.dart';

abstract class ProfileRepo {
  // Remote + Local main flow
  Future<ProfileModel?> getProfile(String uid);

  // Local
  ProfileModel? getLocalProfile();
  Future<void> saveLocalProfile(ProfileModel profile);
  bool hasLocalProfile();

  // Remote
  Future<void> createProfile(String uid, ProfileModel profile);
  Future<void> updateProfile(String uid, ProfileModel profile);

  // Utils
  String getCurrentUid();
  String getName();


}