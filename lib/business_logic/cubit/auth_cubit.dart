import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  void checkUser() {
    final user = auth.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user: auth.currentUser!));
    } else {
      emit(AuthUnAuthenticated());
    }
  }

  void logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthAuthenticated(user: auth.currentUser!));
    } on Exception catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(user: auth.currentUser!));
    } on Exception catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
    emit(AuthUnAuthenticated());
  }
}
