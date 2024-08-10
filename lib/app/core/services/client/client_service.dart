abstract interface class ClientService {
  Future get(String url, {bool requiresAuth, String contentType});
  Future post(String url, Object data);
  Future put(String url, Object data);
}
