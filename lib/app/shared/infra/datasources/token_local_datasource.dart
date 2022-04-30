abstract class TokenLocalDataSource {
  Future<void> setToken(String token);
  Future<String?> fetchToken();
}
