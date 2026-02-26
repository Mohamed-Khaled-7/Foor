import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:musa/business_logic/cubit/profile_cubit.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/profile_model.dart';
import 'package:musa/main.dart';
import 'package:musa/presentation/views/login_view.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void checkUser({required AuthSource source}) {
    final user = auth.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user: auth.currentUser!, source: source));
    } else {
      emit(AuthUnAuthenticated());
    }
  }

  void logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final user = auth.currentUser!;
      emit(AuthAuthenticated(user: user, source: AuthSource.Login));
    } on Exception catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  Future<void> register(
    ProfileModel profile,
    String email,
    String password,
  ) async {
    emit(AuthLoading());
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await firestore
          .collection("users")
          .doc(auth.currentUser?.uid)
          .set(profile.toJson());
      emit(
        AuthAuthenticated(user: auth.currentUser!, source: AuthSource.Register),
      );
    } on Exception catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  void logOut() async {
    emit(AuthLoading());
    await auth.signOut();
    Hive.box<ProfileModel>(ProfileBox).clear();
    profileCubit.resetProfile();
    emit(AuthUnAuthenticated());
    emit(AuthInitial());
  }

  Future<void> confirmSignOut(BuildContext context) async {
    bool? result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(LucideIcons.logOut, color: Colors.redAccent),
              const SizedBox(width: 10),
              Text(
                'Sign Out',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to sign out?',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Sign Out',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (result == true) {
      logOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.id,
        (route) => false,
      );
    }
  }
}
