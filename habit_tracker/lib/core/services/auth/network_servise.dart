class NetworkService {
  Future<T> executeWithRetry<T>(Future<T> Function() request) async {
    int attempts = 0;
    while (attempts < 3) {
      try {
        return await request();
      } catch (e) {
        attempts++;
        if (attempts >= 3) rethrow;
        await Future.delayed(Duration(seconds: attempts));
      }
    }
    throw Exception('Failed after 3 attempts');
  }
}
