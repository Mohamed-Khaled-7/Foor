// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musa/features/profile/data/models/profile_model.dart';

class GetProfileDataSource {
  final FirebaseFirestore firestore;
  GetProfileDataSource({required this.firestore});

  Future<ProfileModel?> fetchProfile(String uid) async {
    try {
      DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
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

  Future<void> createUserProfile(String uid, ProfileModel profile) async {
    await firestore.collection('users').doc(uid).set(profile.toJson());
  }

  Future<void> updateProfile(String uid, ProfileModel profile) async {
    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      await firestore.collection('users').doc(uid).update(profile.toJson());
    }
  }
}
