// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  FirebaseAuth firebaseAuth;
  AuthRemoteDataSource({required this.firebaseAuth});
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }

  String? getUid() {
    return firebaseAuth.currentUser?.uid;
  }

  bool isLoggedIn() {
    return firebaseAuth.currentUser != null;
  }
}
