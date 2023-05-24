abstract class AuthLocalDataSource {
  Future<String?> get();
  Future<void> save(String token);
  Future<void> remove();
}
