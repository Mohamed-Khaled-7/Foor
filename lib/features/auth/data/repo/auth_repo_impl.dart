import 'package:musa/features/auth/data/data_source/remote/auth.dart';
import 'package:musa/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});
  @override
  String? getCurrentUid() {
    return remoteDataSource.getUid();
  }

  @override
  Future<String?> login(String email, String password) async {
    final user = await remoteDataSource.signIn(
      email: email,
      password: password,
    );
    return user.user!.uid;
  }

  @override
  Future<String?> register(String email, String password) async {
    final user = await remoteDataSource.signUp(
      email: email,
      password: password,
    );
    return user.user!.uid;
  }

  @override
  Future<void> signOut() async{
    return remoteDataSource.signOut();
  }
  
  @override
  bool isLoggedIn() {
    return remoteDataSource.isLoggedIn();
  }
}
