// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/datasource/local/local_profile_datascource.dart';
import 'package:musa/data/models/profile_model.dart';

class ProfileRepository {
  ProfileDataSource profileDataSource;
  ProfileRepository({required this.profileDataSource});
  var profileBox = Hive.box<ProfileModel>(ProfileBox);
  ProfileModel? getProfileLocal() {
    return profileDataSource.getProfile();
  }

  void saveProfileLocal(ProfileModel profile) {
    profileDataSource.saveProfile(profile);
  }


  bool HasLocalProfile() {
    return profileDataSource.checkProfileExists();
  }

  getName() {
    return profileDataSource.getName();
  }

 

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  getCurrentUid() {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }

  Future<bool> hasRemoteProfile(uid) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    return doc.exists;
  }

  Future<ProfileModel?> fetchProfileFromServer(uid) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    try {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProfileModel.fromJson(data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }

  Future<void> CurrentUserProfile(uid, ProfileModel? profile) async {
    final Profile = await profile;
    await firestore.collection('users').doc(uid).set(Profile!.toJson());
  }

  UpdateProfile(uid, ProfileModel profile) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      await firestore.collection('users').doc(uid).update(profile.toJson());
    }
  }

  Future<String> uploadImageToStorage(String path, String uid) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('profiles')
        .child('$uid.jpg');
    File file = File(path);
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask;
    String url = await ref.getDownloadURL();
    return url;
  }
}
