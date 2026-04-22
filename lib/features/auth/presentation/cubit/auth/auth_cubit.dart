import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musa/features/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final uid = await authRepo.login(email, password);
      emit(AuthAuthenticated(uid: uid, source: AuthStateSource.login));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final uid = await authRepo.register(email, password);
      emit(AuthAuthenticated(uid: uid, source: AuthStateSource.register));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await authRepo.signOut();
      emit(AuthUnAuthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errMessage: e.toString()));
    }
  }
  void checkUser()
  {
    if (authRepo.isLoggedIn()) {
      final uid = authRepo.getCurrentUid();
      emit(AuthAuthenticated(uid:  uid,source: AuthStateSource.login));
    } else {
      emit(AuthUnAuthenticated());
    }
  }

}
