import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = "http://10.0.2.2:8080/api/v1";
  final _storage = FlutterSecureStorage();
  final _accessTokenName = "accessToken";
  final _refreshTokenName = "refreshToken";

  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  factory ApiClient() => _instance;


  Future<Map<String, String>> _getAccessTokenHeader() async {
    var token = await _storage.read(key: "accessToken");
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    await _storage.write(key: _accessTokenName, value: accessToken);
    await _storage.write(key: _refreshTokenName, value: refreshToken);
  }

  Future<http.Response> post(String endpoint, Object body) async {
    final headers = await _getAccessTokenHeader();
    final url = Uri.parse("$baseUrl+/$endpoint");

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> get(String endpoint) async {
    final headers = await _getAccessTokenHeader();
    final url = Uri.parse("$baseUrl+/$endpoint");

    return await http.get(url, headers: headers);
  }

  Future<http.Response> put(String endpoint, Object body) async {
    final headers = await _getAccessTokenHeader();
    final url = Uri.parse("$baseUrl+/$endpoint");

    return await http.put(url, body: jsonEncode(body), headers: headers);
  }

  Future<http.Response> delete(String endpoint) async {
    final headers = await _getAccessTokenHeader();
    final url = Uri.parse("$baseUrl+/$endpoint");

    return await http.delete(url, headers: headers);
  }

  Future<http.Response> patch(String endpoint, Object? body) async {
    final headers = await _getAccessTokenHeader();
    final url = Uri.parse("$baseUrl+/$endpoint");

    return await http.patch(
      url,
      body: body != null ? jsonEncode(body) : null,
      headers: headers,
    );
  }
}
