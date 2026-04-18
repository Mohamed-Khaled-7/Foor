import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musa/data/models/profile_model.dart';

class GetProfileService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? getCurrentUid() {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    return uid;
  }

  Future<bool> hasProfile(String uid) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    return doc.exists;
  }
  Future<ProfileModel?> fetchProfileFromServer(String uid) async {
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

  void currentUserPofile(String uid, ProfileModel profile) {
    firestore.collection('users').doc(uid).set(profile.toJson());
  }

  void updateProfile(String uid, ProfileModel profile) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      await firestore.collection('users').doc(uid).update(profile.toJson());
    }
  }

  
}
