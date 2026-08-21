import 'dart:convert';

import 'package:challenge_lab_flutter/core/constants/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final _storage = FlutterSecureStorage();

  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  factory ApiClient() => _instance;


  Future<Map<String, String>> _getAccessTokenHeader() async {
    var token = await _storage.read(key: AppConstants.accessTokenName);
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: AppConstants.refreshTokenName);
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    await _storage.write(key: AppConstants.accessTokenName, value: accessToken);
    await _storage.write(key: AppConstants.refreshTokenName, value: refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: AppConstants.accessTokenName);
    await _storage.delete(key: AppConstants.refreshTokenName);
  }

  Future<http.Response> _performRequest(
    Future<http.Response> Function() request, {
    bool isRefresh = false,
  }) async {
    var response = await request();

    if (response.statusCode == 401 && !isRefresh) {
      final success = await refresh();
      if (success) {
        // Retry the original request with new token
        return await request();
      }
    }

    return response;
  }

  Future<bool> refresh() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) return false;

    final url = Uri.parse("${AppConstants.baseUrl}/${AppConstants.refreshEndpoint}");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        await saveTokens(body['accessToken'], body['refreshToken']);
        return true;
      }
    } catch (e) {
      // Log error
    }

    await clearTokens();
    return false;
  }

  Future<http.Response> post(String endpoint, Object? body) async {
    return _performRequest(() async {
      final headers = await _getAccessTokenHeader();
      final url = Uri.parse("${AppConstants.baseUrl}/$endpoint");
      return await http.post(url, headers: headers, body: jsonEncode(body));
    });
  }

  Future<http.Response> get(String endpoint) async {
    return _performRequest(() async {
      final headers = await _getAccessTokenHeader();
      final url = Uri.parse("${AppConstants.baseUrl}/$endpoint");
      return await http.get(url, headers: headers);
    });
  }

  Future<http.Response> put(String endpoint, Object? body) async {
    return _performRequest(() async {
      final headers = await _getAccessTokenHeader();
      final url = Uri.parse("${AppConstants.baseUrl}/$endpoint");
      return await http.put(url, body: jsonEncode(body), headers: headers);
    });
  }

  Future<http.Response> delete(String endpoint) async {
    return _performRequest(() async {
      final headers = await _getAccessTokenHeader();
      final url = Uri.parse("${AppConstants.baseUrl}/$endpoint");
      return await http.delete(url, headers: headers);
    });
  }

  Future<http.Response> patch(String endpoint, Object? body) async {
    return _performRequest(() async {
      final headers = await _getAccessTokenHeader();
      final url = Uri.parse("${AppConstants.baseUrl}/$endpoint");
      return await http.patch(
        url,
        body: body != null ? jsonEncode(body) : null,
        headers: headers,
      );
    });
  }
}
