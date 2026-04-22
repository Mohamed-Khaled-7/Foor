abstract class AuthRepo {
  Future<String?> login(String email, String password);
  Future<String?> register(String email, String password);
  Future<void> signOut();
  String? getCurrentUid();
  bool isLoggedIn();
}
