import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:musa/data/models/profile_model.dart';

class GetProfileService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  getCurrentUid() {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    return uid;
  }

  Future<bool> hasProfile(uid) async {
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

  CurrentUserPofile(uid, ProfileModel profile) {
    firestore.collection('users').doc(uid).set(profile.toJson());
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
    TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
