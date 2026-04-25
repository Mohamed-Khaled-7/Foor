import 'package:firebase_auth/firebase_auth.dart';
import 'package:musa/features/profile/data/data_source/local/local_profile_ds.dart';
import 'package:musa/features/profile/data/data_source/remote/remote_profile.dart';
import 'package:musa/features/profile/data/models/profile_model.dart';
import 'package:musa/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final RemoteProfileDataSource remoteDataSource;
  final LocalProfileDataSource localDataSource;
  ProfileRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<void> createProfile(String uid, profile) {
    return remoteDataSource.createUserProfile(uid, profile);
  }

  @override
  String getCurrentUid() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return uid ?? '';
  }

  @override
  getLocalProfile() {
    return localDataSource.getProfile();
  }

  @override
  String getName() {
    final local = localDataSource.getProfile();
    if (local != null) {
      return "${local.firstName!}  ${local.lastName!}";
    }
    return 'Guest User';
  }

  @override
  Future<ProfileModel?> getProfile(String uid) async {
    final local = localDataSource.getProfile();
    if (local != null) return local;
    final remote = await remoteDataSource.fetchProfile(uid: uid);
    if (remote != null) {
      await localDataSource.saveProfile(remote);
      return remote;
    }
    return null;
  }

  @override
  bool hasLocalProfile() {
    return localDataSource.checkProfileExists();
  }

  @override
  Future<void> saveLocalProfile(profile) {
    return localDataSource.saveProfile(profile);
  }

  @override
  Future<void> updateProfile(String uid, profile) async {
    return await remoteDataSource.updateProfile(uid, profile);
  }
}
