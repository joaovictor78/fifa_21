import 'package:dio/dio.dart';
import '../contracts/i_http_client.dart';

class CustomDio implements IHttpClient {
  CustomDio(this._client, String apiUrl) {
    _client.options.baseUrl = apiUrl;
    _client.options.connectTimeout = 5000;
  }
  final Dio _client;

  @override
  Future get(String endpoint, {dynamic queryParameters}) async {
    return await _client.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future post(String endpoint, {dynamic data}) async {
    return await _client.post(endpoint, data: data);
  }

  @override
  Future delete(String endpoint, {dynamic data}) async {
    return await _client.delete(endpoint, data: data);
  }

  @override
  Future put(String endpoint, {dynamic data}) async {
    return await _client.put(endpoint, data: data);
  }
}
