import 'dart:convert';

import 'package:challenge_lab_flutter/core/constants/app_constants.dart';
import 'package:challenge_lab_flutter/core/network/api_client.dart';
import 'package:challenge_lab_flutter/features/auth/data/models/auth_models.dart';

class AuthService {
  final _client = ApiClient();

  Future<void> login(LoginRequest request) async {
    var response = await _client.post(AppConstants.loginEndpoint, request.toJson());

    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final tokenRes = TokenResponse.fromJson(body);
      _client.saveTokens(tokenRes.accessToken, tokenRes.refreshToken);
      return;
    }

    _handleError(body);
  }

  Future<void> logout() async {
    await _client.post(AppConstants.logoutEndpoint, null);
    _client.clearTokens();
  }

  Future<TokenResponse> register(RegisterRequest request, String role) async {
    var response = await _client.post(
      "${AppConstants.registerEndpoint}?role=${role.toUpperCase()}",
      request.toJson(),
    );

    var body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final tokenRes = TokenResponse.fromJson(body);
      _client.saveTokens(tokenRes.accessToken, tokenRes.refreshToken);
      return tokenRes;
    }

    _handleError(body);
    throw Exception("Unknown error during registration");
  }

  void _handleError(Map<String, dynamic> body) {
    if (body.containsKey("fields")) {
      final fields = body["fields"] as List;
      final message = fields.map((e) => "${e["field"]}: ${e["message"]}").join("\n");
      throw Exception(message);
    }
    throw Exception(body["title"] ?? "An unexpected error occurred.");
  }

  Future<void> refresh() async {
    var response = await _client.post(AppConstants.refreshEndpoint, {
      'refreshToken': await _client.getRefreshToken(),
    });

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      _client.saveTokens(body['accessToken'], body['refreshToken']);
      return;
    } else {
      var error = jsonDecode(response.body);
      throw Exception('${error["message"]}');
    }
  }
}
