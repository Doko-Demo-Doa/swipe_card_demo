import 'package:dio/dio.dart';

class MainApiClient {
  static String baseUrl = 'https://randomuser.me/api/0.5/';
  static final defaultPort = 80;

  static BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000
  );

  static Dio _httpClient = new Dio(options);

  static Future<Response> getUrl(endpoint) async {
    Response response = await _httpClient.get(endpoint);
    return response;
  }
}